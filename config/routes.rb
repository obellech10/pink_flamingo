Rails.application.routes.draw do
  root 'welcome#index'

  get '/about', to: 'about#show', as: :about

  get '/auth/facebook', as: :facebook_login

  get 'auth/facebook/callback', to: 'sessions#create'
  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get '/profile', to: 'users#show', as: :profile

  resources :users, only: [:new, :create]

  resources :events, only: [:index, :show, :new, :create]
end
