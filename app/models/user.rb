class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :tales
  has_many :comments
    
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :login, :role_ids
  
  attr_accessor :login
  
  validates :username, :presence => true,
                    :uniqueness => { :case_sensitive => false }
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  
  # check if user has such priviliges
  def role?(role)
    return self.roles.find_by_name(role).try(:name) == role.to_s
  end
  
  after_create :addrole
  
  # add a role to newly created user ( new record to Roles_Users )
  def addrole
    User.last.role_ids = [ Role.find_by_name('regular').id ]
  end
  
  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  #override to prevent deleted users from log in
  def active_for_authentication?
    super && !deleted_at
  end

end
