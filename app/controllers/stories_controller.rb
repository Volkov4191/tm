class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new( story_params )

    if @story.save
      redirect_to :controller => 'stories', :action => 'show', :id => @story.id
    else
      render 'new'
    end
  end

  def show
    @story = Story.find( params[:id] )

    @comment = StoryComment.new()
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def event
    story = Story.find( params[:id] )

    if story
      story.fire_state_event( params[:event] )
      story.save
      redirect_to :controller => 'stories', :action => 'show', :id => story.id
    end
  end

  private
    def story_params
      params.require(:story).permit( :title, :body, :author_id )
    end

end
