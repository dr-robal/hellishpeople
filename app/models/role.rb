class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  #before_save :lowercasename
  
  #def lowercasename
  #  self.name = self.name.downcase
  #end
end
