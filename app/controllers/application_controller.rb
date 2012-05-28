class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
  
  #rescue_from ActiveRecord::RecordNotFound do |exception|
  #  if params[:format] == 'json'
  #    render :json => {:error => 'Resource not found'}, :status => 404
  #  end
  #end
end
