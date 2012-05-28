require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get userslist" do
    get :userslist
    assert_response :success
  end

end
