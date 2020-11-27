Rails.application.routes.draw do
  root 'companies#index', as: 'companies_index'

  resources :users
  post 'register', to: 'users#register'  

  resources :companies do
    resources :contact_people
    resources :notes
  end

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'register', to: 'sessions#register'
  get 'logout', to: 'sessions#destroy'
end
