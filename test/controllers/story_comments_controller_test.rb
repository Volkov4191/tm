require 'test_helper'
include ApplicationHelper

class StoryCommentsControllerTest < ActionController::TestCase
  def setup
    @comment = FactoryGirl.create( :story_comment )
    auth @comment.author
  end

  def teardown
    @comment = nil
  end


  test "should create comment" do
    assert_difference('StoryComment.count') do
      post :create, story_comment: {body: @comment.body, author_id: @comment.author_id, story_id: @comment.story_id }
    end

    assert_equal 'Comment was successfully created', flash[:notice]

    assert_redirected_to story_path( @comment.story_id )
  end

  test "should get edit" do
    get :edit, { :id => @comment.id }
    assert_response :success
    assert_not_nil assigns(:comment)
  end

  test "should update comment" do
    put :update, :id => @comment.id, story_comment: { body:'StoryCommentBody_edit', author_id: @comment.author_id, story_id: @comment.story_id }

    assert_equal 'Comment was successfully updated', flash[:notice]

    assert_redirected_to story_path( @comment.story_id )
  end

  test "should destroy comment" do

    story_id =  @comment.story_id

    assert_difference('StoryComment.count', -1) do
      delete :destroy, { :id => @comment.id }
    end

    assert_equal 'Comment was successfully deleted', flash[:notice]

    assert_redirected_to story_path( story_id )
  end

end
