class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  
  belongs_to :tale # by tale_ids
  belongs_to :user
  
  attr_accessible :body
  
  validates :body, :presence => true
  
  def tale
	  return @tale if defined?(@tale)
 	  @tale = commentable.is_a?(Tale) ? commentable : commentable.tale
	end
  
end
