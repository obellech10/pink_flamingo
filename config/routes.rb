Rails.application.routes.draw do
  root 'welcome#index'

  get '/about', to: 'about#show', as: :about
  get '/login', to: "sessions#new", as: :login

  get '/auth/google', as: :google_login
  get '/auth/facebook', as: :facebook_login

  get '/profile', to: 'users#show', as: :profile
  resources :events, only: [:index, :show]

  get 'auth/facebook/callback', to: 'facebook/sessions#create'
  get 'auth/failure', to: redirect('/')
end
