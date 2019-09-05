Rails.application.routes.draw do
  root 'welcome#index'

  get '/about', to: 'welcome#about', as: :about
  get '/login', to: "sessions#new", as: :login

  get '/auth/google', as: :google_login
  get '/auth/facebook', as: :facebook_login

  resources :profile, only: [:show]
  resources :events, only: [:index, :show]

  get 'auth/facebook/callback', to: 'facebook/sessions#create'
  get 'auth/failure', to: redirect('/')
end
