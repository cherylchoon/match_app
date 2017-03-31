Rails.application.routes.draw do
  root "sessions#index"
  get "/homepage" => "sessions#home_page"
  # create dummy user
  get "/createuser" => "sessions#createuser"
  post "/users/:id/update" => "users#update"
  get "/login" => "sessions#new"
  put "/deactivate/:id" => "users#deactivate"

  #likes
  get "/likes/add/:id" => "likes#add"
  get "/likes/remove/:id" => "likes#remove"

  #search page
  get '/search' => "matches#search"

  resources :users, except: [:index]
  resources :sessions, only: [:create, :destroy]

  resources :images, only: [:show, :create, :destroy]
  resources :conversations, only: [:index, :show]
  resources :personal_messages, only: [:new, :create]

  get "images/destroy/:id" => "images#destroy"

  resources :profiles
  resources :preferences
  resources :matches, only: [:create, :show]

  resources :chats do
    resources :chat_messages
  end

end
