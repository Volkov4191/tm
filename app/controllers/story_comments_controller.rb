class StoryCommentsController < ApplicationController
  def create
    @comment = StoryComment.new( comment_params )

    if @comment.save
      redirect_to :controller => 'stories', :action => 'show', :id => @comment.story_id
    end
  end

  private
    def comment_params
      params.require(:story_comment).permit( :body, :story_id, :author_id )
    end

end
