module TalesHelper
  
  def taleowner tale
    signed_in? && current_user.id == tale.user_id ? true : false 
  end
end
