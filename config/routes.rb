Rails.application.routes.draw do
  root :to => 'home#index'
  get 'static_pages/about'
  get '/index', to: 'home#index'
  get '/show', to: 'meters#show'
  get '/meters/new' , to: 'meters#new'
  post '/meters/new', to: 'meters#create'
end
