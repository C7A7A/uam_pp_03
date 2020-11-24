Rails.application.routes.draw do
  root 'users#index', as: 'user_index'

  resources :users
  post 'register', to: 'users#register'  

  resources :companies

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'register', to: 'sessions#register'
  get 'logout', to: 'sessions#destroy'
end
