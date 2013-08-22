require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  include ApplicationHelper

  def setup
    @user = FactoryGirl.create(:user)
  end

  def teardown
    @user = nil
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should create session" do

    assert_equal current_user, nil

    post :create, {email: @user.email, password: @user.password }

    assert_equal current_user, @user

    assert_equal "Welcome to Simple Task Manager", flash[:notice]
    assert_redirected_to stories_url
  end

  test "should not create session" do

    assert_equal current_user, nil

    post :create, {email: @user.email, password: @user.password + 's' }

    assert_equal current_user, nil

    assert_equal "Invalid email or password", flash[:error]
    assert_template 'login'
  end

  test "should destroy session" do
    post :logout, user: {id: @user.id}
    assert_equal 'Logged out!', flash[:notice]

    assert_redirected_to login_url
  end

end
