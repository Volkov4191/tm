Taskmanager::Application.routes.draw do

  root to: "stories#index"

  resources :users
  resources :sessions
  resources :stories
  resources :story_comments

  get '/stories/:id/:event', to: 'stories#event'

  get 'login' => 'sessions#login', as: 'login'
  get 'logout' => 'sessions#logout'
  get 'signup' => 'users#new'

end
