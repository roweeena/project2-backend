Rails.application.routes.draw do
  resources :users, only: [:create, :show, :index] do
      resources :items, only: [:create, :show, :index, :destroy]
    end
resources :characters
resources :items

  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/logged_in' => 'sessions#is_logged_in?'
  get '/login' => 'sessions#new'

end
