Rails.application.routes.draw do
  root to: 'sessions#new'
  get '/home', to: 'businesses#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :reviews, only: [:index]

  resources :businesses, only: [:show, :new, :create] do
    collection do
      get 'search'
    end
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:create, :show]
  get 'ui(/:action)', controller: 'ui'
end
