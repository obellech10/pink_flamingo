Rails.application.routes.draw do
  root 'welcome#index'
  get '/about', to: 'welcome#about', as: :about
  get '/login', to: "sessions#new", as: :login

  get '/auth/google', as: :google_login
  get '/auth/facebook', as: :facebook_login
  get 'auth/facebook/callback', to: 'facebook/sessions#create'
  get 'auth/failure', to: redirect('/')

  get '/profile', to: 'users#show', as: :profile
end
