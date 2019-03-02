Rails.application.routes.draw do
  resources :meters
  resources :appliances
  resources :static_pages
  root :to => 'home#index'
  get 'static_pages/about'
  get '/index', to: 'home#index'
  post 'meters/create_auto', to: 'meters#create_auto'
end
