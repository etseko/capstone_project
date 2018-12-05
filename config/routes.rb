Rails.application.routes.draw do
  resources :meters
  resources :appliances
  resources :static_pages
  root :to => 'home#index'
  get 'static_pages/about'
  get '/index', to: 'home#index'
  #get 'meters/show', to: 'meters#show'
  #get '/meters/new' , to: 'meters#new'
  #post '/meters/new', to: 'meters#create'
  #get 'appliances/show', to:'appliances#show'
end
