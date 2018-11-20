Rails.application.routes.draw do
  root :to => 'home#index'
  get 'static_pages/about'
  get '/index', to: 'home#index'
end
