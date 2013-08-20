class StoryCommentsController < ApplicationController
  def create
    @comment = StoryComment.new( comment_params )

    if @comment.save
      flash[:notice] = "Comment was successfully created"
      redirect_to story_path( @comment.story_id )
    end
  end

  def edit
    @comment = StoryComment.find( params[:id] )
  end

  def update
    @comment = StoryComment.find( params[:id] )

    if @comment.update( comment_params )
      flash[:notice] = "Comment was successfully updated"
      redirect_to story_path(@comment.story_id)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = StoryComment.find( params[:id] )

    story_id = @comment.story_id

    if @comment.destroy
      flash[:notice] = "Comment was successfully deleted"
    end

    redirect_to story_path( story_id )
  end

  private
    def comment_params
      params.require(:story_comment).permit( :body, :story_id, :author_id )
    end

end
