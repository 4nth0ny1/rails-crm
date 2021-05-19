Rails.application.routes.draw do
  root 'home#index'

  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
  
  resources :users
  resources :accounts do 
      resources :contacts, only: [:new]
      resources :opportunities, only: [:new]
  end 
  resources :contacts, except: [:new]
  resources :opportunities, except: [:new]
  resources :products
  resources :dashboards
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
