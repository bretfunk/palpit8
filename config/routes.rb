Rails.application.routes.draw do
  root "games#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/dashboard", to: "dashboard#show"

  namespace :admin do
    resources :games
    resources :chatrooms
  end

  namespace :search do
    resources :games, only: [:index]
    resources :channels, only: [:index]
    resources :streams, only: [:index]
  end

  resources :messages
  resources :chatrooms, param: :slug
  resources :streamers, only: [:show]
  resources :follow, only: [:edit]
  resources :games, param: :slug,  only: [:show, :index]
  resources :search, only: [:index]

  mount ActionCable.server => '/cable'

end
