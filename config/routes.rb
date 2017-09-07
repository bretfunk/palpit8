Rails.application.routes.draw do
  root "games#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/dashboard", to: "dashboard#show"

  namespace :admin do
    resources :games
    resources :chatrooms
  end

  resources :messages
  resources :chatrooms, param: :slug
  resources :streamers, only: [:show]
  resources :follow, only: [:index, :new, :create]
  resources :games, param: :slug,  only: [:show, :index]
  resources :search, only: [:show, :index]

  mount ActionCable.server => '/cable'

end
