require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  include ApplicationHelper

  def setup
    @user = users(:one)
  end

  def teardown
    @user = nil
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should create session" do

  end

  test "should destroy session" do
    post :logout, user: {id: @user.id}
    assert_equal 'Logged out!', flash[:notice]

    assert_redirected_to login_url
  end

end
