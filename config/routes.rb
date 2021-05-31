Rails.application.routes.draw do
  root 'home#index'

  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
  
  resources :users
  resources :accounts do 
      resources :contacts, only: [:new, :index]
      resources :opportunities, only: [:new]
      resources :connections, only: [:new]
      resources :tasks, only: [:new]
  end 
  resources :contacts, except: [:new]
  resources :opportunities, except: [:new]
  resources :connections, except: [:new]
  resources :products
  resources :dashboards
  resources :suggestions
  resources :tasks, except: [:new]
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'about', to: 'about#index', as: 'about'

end

