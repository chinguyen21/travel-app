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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
