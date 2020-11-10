Rails.application.routes.draw do
  root 'users#index', as: 'user_index'

  resources :users
  resources :roles
end
