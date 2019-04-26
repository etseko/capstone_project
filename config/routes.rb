Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  resources :users
  post '/meters/create_auto', to: 'meters#create_auto'
  resources :meters
  resources :appliances
  resources :static_pages
  root :to => 'home#index'


end
