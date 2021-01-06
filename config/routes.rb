Rails.application.routes.draw do


  resources :destinations, only: [:show, :index] do
    resources :events, only: [:show, :index]
  end
  resources :users

  resources :users, only: [:show, :index] do
    resources :itineraries, only: [:show, :index]
    resources :favorites, only: :index
  end
  resources :event_entries
  resources :entries
  resources :itineraries
  resources :events
  resources :favorites
  resources :reviews
  resources :user_events
  resources :destinations
  resources :users

  put '/users/:id/itineraries/:id', to: "entries#update", as: "update_entry"
  # post '/destinations/:id', to: "favorites#create", as: "create_favorite"

  root 'sessions#welcome', as: 'welcome'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
