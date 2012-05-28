module CommentsHelper
  def commentowner comment
    signed_in? && current_user.id == comment.user_id ? true : false 
  end
end
