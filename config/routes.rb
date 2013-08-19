Taskmanager::Application.routes.draw do

  root to: "stories#index"
  resource :users
  resource :sessions
  resource :stories, :except => :show
  get '/stories', to: 'stories#index'
  get '/stories/:id', to: 'stories#show'
  get '/stories/:id/:event', to: 'stories#event'

  resource :story_comments

  get 'login' => 'sessions#login'
  get 'signup' => 'users#new'

end
