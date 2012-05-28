class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:profile]
  load_and_authorize_resource
  
  def profile
    @user = User.find(params[:id])
    @tales = @user.tales.paginate(:page => params[:page], :per_page => 5)
    
    @title = 'profile - ' + @user.username
  end

  def show
    
  end
  
  def userslist
    @users = User.paginate(:page => params[:page], :per_page => 20, :conditions => ['deleted_at is ?', nil ] )
    #.excludes(:id => current_user.id)
  end
  
  def edit
	    @user = User.find(params[:id])
	end
	   
  def update
    @user = User.find(params[:id])
    #params[:user].delete(:password) if params[:user][:password].blank?
    #params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to userslist_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    
    #@user.update_attribute(:deleted_at, Time.current)
    @user.soft_delete
    flash[:notice] = "Successfully deleted user."
    redirect_to userslist_path
  end
end
