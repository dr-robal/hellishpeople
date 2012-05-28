require 'spec_helper'

describe UsersController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET 'profile'" do
    
    it "should be successful" do
      get :profile, :id => @user.id
      response.should be_success
    end
    
    it "should find the right user" do
      get :profile, :id => @user.id
      assigns(:user).should == @user
    end
    
  end

end