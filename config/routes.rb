Rails.application.routes.draw do
  root 'welcome#index'
  get '/about', to: 'welcome#about', as: :about
  get '/login', to: "sessions#new"

  get '/auth/google', as: :google_login
  get '/auth/facebook', as: :facebook_login
  # get '/login/callback', to: 'facebook/sessions#create'
  get 'auth/facebook/callback', to: 'facebook/sessions#create'
  get 'auth/failure', to: redirect('/')
end
