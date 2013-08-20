class StoriesController < ApplicationController

  def index
    @filter = Story.search(params[:q])
    @stories = @filter.result
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new( story_params )

    if @story.save
      flash[:notice] = "Story was successfully created"
      redirect_to story_path( @story )
    else
      render 'new'
    end
  end

  def show
    @story = Story.find( params[:id] )

    @comment = StoryComment.new()
  end

  def edit
    @story = Story.find( params[:id] )
  end

  def update
    @story = Story.find( params[:id] )

    if @story.update( story_params )
      flash[:notice] = "Story was successfully updated"
      redirect_to story_path( @story )
    else
      render 'edit'
    end
  end

  def destroy
    @story = Story.find( params[:id] )
    @story.destroy

    flash[:notice] = "Story was successfully deleted"
    redirect_to stories_path
  end

  def event
    @story = Story.find( params[:id] )

    if @story
      @story.fire_state_event( params[:event] )
      @story.save

      flash[:notice] = "Story state was successfully updated"
      redirect_to story_path( @story )
    end
  end

  private
  def story_params
    params.require(:story).permit( :title, :body, :author_id, :performer_id )
  end

end
