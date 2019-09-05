Rails.application.routes.draw do

  root 'welcome#index'
  get '/about', to: 'welcome#about', as: :about
  get '/login', to: "sessions#new"

end
