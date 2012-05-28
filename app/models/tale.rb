class Tale < ActiveRecord::Base
  belongs_to :user
  
  # polymorphic association to commentable_id & commentable_type
  has_many :comments, :as => :commentable
  
  # used to receive number of comments belonged to tale
  # tale.commentaries - gives all comments with tale_ids equal to tale.id
  has_many :commentaries, :foreign_key => :tale_ids,
                        :class_name => 'Comment' 
  
  attr_accessible :content, :description
  
  before_create :default_values
  #before_validation :default_values
  
  validates :content, :presence => true
  
  validates :description, :presence => true,
                          :length   => { :maximum => 50 }
                        
  #validates :main, :inclusion => { :in => [true, false] },
  #                 :allow_blank => true
  
  def default_values
    
    self.main = false if self.main==nil
  end
end
