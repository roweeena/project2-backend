Rails.application.routes.draw do
  resources :users, only: [:create, :show, :index] do
      resources :items, only: [:create, :show, :index, :destroy]
    end
resources :characters
resources :items

get '/login' => 'sessions#new'
post '/login' => "sessions#create"
delete '/login' => 'sessions#destroy'
end
