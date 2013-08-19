class StoryCommentsController < ApplicationController
  def create
    @comment = StoryComment.new( comment_params )

    if @comment.save
      redirect_to story_path( @comment.story )
    end
  end

  def edit
    @comment = StoryComment.find( params[:id] )
  end

  def update
    @comment = StoryComment.find( params[:id] )

    if @comment.update( comment_params )
      redirect_to @comment.story
    else
      render 'edit'
    end
  end

  def destroy
    @comment = StoryComment.find( params[:id] )
    @comment.destroy

    redirect_to story_path(@comment.story)
  end

  private
    def comment_params
      params.require(:story_comment).permit( :body, :story_id, :author_id )
    end

end
