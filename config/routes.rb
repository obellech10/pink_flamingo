Rails.application.routes.draw do
  root 'welcome#index'
  get '/about', to: 'about#show', as: :about
  get '/login', to: "sessions#new"

  get '/auth/google', to: 'google_session#create', as: :google_login
  get '/auth/facebook', as: :facebook_login
end
