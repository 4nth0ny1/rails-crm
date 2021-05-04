Rails.application.routes.draw do
  root 'home#index'

  get ‘auth/:provider/callback’, to: 'sessions#googleAuth'
  get ‘auth/failure’, to: redirect(‘/’)
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
