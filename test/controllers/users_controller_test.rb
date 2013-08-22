require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = FactoryGirl.build(:user)
  end

  def teardown
    @user = nil
  end

  test "should get registration form" do
    get :new
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {email: @user.email, password: @user.password, password_confirmation: @user.password }
    end

    assert_equal 'Welcome to Simple Task Manager', flash[:notice]

    assert_redirected_to stories_url
  end
end
