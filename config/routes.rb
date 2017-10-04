Rails.application.routes.draw do
  resources :businesses, only: [:index]
  resources :users, only: [:create]
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'

  get 'ui(/:action)', controller: 'ui'
end
