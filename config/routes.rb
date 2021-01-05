Rails.application.routes.draw do
  resources :event_entries
  resources :entries
  resources :itineraries
  resources :events
  resources :favorites
  resources :reviews
  resources :user_destinations
  resources :destinations
  resources :users

  root 'sessions#welcome', as: 'welcome'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
