Rails.application.routes.draw do
  root to: "toppages#index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "signup", to: "users#new"

  get "detail", to:"toppages#show"

  resources :users do
    member do
      get :followings
      get :followers
    end
  end

  resources :posts do
    resources :comments, only: [:create]
  end

  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

end
