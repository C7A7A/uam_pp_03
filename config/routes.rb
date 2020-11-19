Rails.application.routes.draw do
  root 'users#index', as: 'user_index'

  resources :users
  resources :companies

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
