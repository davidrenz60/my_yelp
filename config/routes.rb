Rails.application.routes.draw do
  root to: 'sessions#new'
  get '/home', to: 'businesses#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users, only: [:create]


  get 'ui(/:action)', controller: 'ui'
end