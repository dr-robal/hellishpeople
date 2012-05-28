class CommentsController < ApplicationController
  before_filter :get_parent, :only => [:new, :create]
  load_and_authorize_resource
  
  def new
    @comment = @parent.comments.build
    
    @submitbuttonlabel = 'Add a comment'
  end

  def create
    @comment = @parent.comments.build(params[:comment])
    @comment.user = current_user
    @comment.tale_ids = @comment.tale.id
    
    if @comment.save
	     redirect_to tale_path(@comment.tale), :notice => 'Thank you for your comment!'
	   else
	     render :new
     end
  end
  
  def edit
    @comment = Comment.find(params[:id])
    
    @submitbuttonlabel = 'Edit comment'
  end
  
  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update_attributes(params[:comment])
        redirect_to tale_path(@comment.tale), :notice => 'Comment updated!'
    else
        render action: "edit"
    end
  end
  
  protected
  
    def get_parent
        @parent = Tale.find_by_id(params[:tale_id]) if params[:tale_id]
        @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]

        redirect_to root_path unless defined?(@parent)
    end
end
