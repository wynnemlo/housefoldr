Rails.application.routes.draw do
  root to: "pages#front"

  get '/home', to: 'items#index'

  resources :items

  resources :users, only: [:create]
  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'log_out', to: 'sessions#destroy'
end
