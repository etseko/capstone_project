Rails.application.routes.draw do
  devise_for :users
  post '/meters/create_auto', to: 'meters#create_auto'
  resources :meters
  resources :appliances
  resources :static_pages
  root :to => 'home#index'
  get 'static_pages/about'
  get '/index', to: 'home#index'
end
