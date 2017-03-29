Rails.application.routes.draw do
  root "sessions#index"

  get "/login" => "sessions#new"
  put "/deactivate/:id" => "users#deactivate"

  resources :users, except: [:index]
  resources :sessions, only: [:create, :destroy]

  resources :images, only: [:show, :create, :destroy]
  resources :conversations, only: [:index, :show]
  resources :personal_messages, only: [:new, :create]

  get "images/destroy/:id" => "images#destroy"

  resources :profiles
  resources :preferences
  resources :matches, only: [:create, :show]

end
