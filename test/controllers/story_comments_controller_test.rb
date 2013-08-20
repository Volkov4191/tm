require 'test_helper'

class StoryCommentsControllerTest < ActionController::TestCase
  def setup
    auth @user = users(:one)

    @comment = story_comments(:one)
    @story = stories(:one)

  end

  def teardown
    @comment = nil
  end


  test "should create comment" do
    assert_difference('StoryComment.count') do
      post :create, story_comment: {body: 'StoryCommentBody', author_id: @user.id, story_id: @story.id }
    end

    assert_equal 'Comment was successfully created', flash[:notice]

    assert_redirected_to story_path( @story )
  end

  test "should get edit" do
    get :edit, { :id => @comment.id }
    assert_response :success
    assert_not_nil assigns(:comment)
  end

  test "should update comment" do
    put :update, :id => @comment.id, story_comment: { body:'StoryCommentBody_edit', author_id: @user.id, story_id: @comment.story_id }

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
