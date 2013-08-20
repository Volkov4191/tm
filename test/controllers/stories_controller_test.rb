require 'test_helper'
include ApplicationHelper

class StoriesControllerTest < ActionController::TestCase
  def setup
    @story = stories(:one)

    auth @user = users(:one)

  end

  def teardown
    @story = nil
  end


  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:story)
  end

  test "should create story" do
    assert_difference('Story.count') do
      post :create, story: {title: 'StoryName', body: 'StoryBody'}
    end

    assert_equal 'Story was successfully created', flash[:notice]

    assert_redirected_to story_path( assigns(:story) )
  end

  test "should get show" do
    get :show, {:id => @story.id }
    assert_response :success
    assert_not_nil assigns(:story)
    assert_not_nil assigns(:comment)
  end

  test "should get edit" do
    get :edit, { :id => @story.id }
    assert_response :success
    assert_not_nil assigns(:story)
  end

  test "should update story" do
    put :update, :id => @story.id, story: { id: @story.id, name:'StoryName_edit', body:'StoryBody_edit', performer_id: @user.id, author_id: @user.id }

    assert_equal 'Story was successfully updated', flash[:notice]

    assert_redirected_to story_path( assigns(:story) )
  end

  test "should destroy story" do
    assert_difference('Story.count', -1) do
      delete :destroy, { :id => @story.id }
    end

    assert_equal 'Story was successfully deleted', flash[:notice]

    assert_redirected_to stories_path
  end

  test "should change state" do
    get :event, { :id => @story.id , :event => 'start'}

    assert_equal 'Story state was successfully updated', flash[:notice]

    assert_redirected_to story_path( assigns(:story) )
  end
end
