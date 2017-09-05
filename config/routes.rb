Rails.application.routes.draw do
  root "home#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/dashboard", to: "dashboard#show"

  resources :messages
  resources :chatrooms, param: :slug
  resources :games, only: [:index, :show]
  resources :streamers, only: [:index, :show]

  mount ActionCable.server => '/cable'
end
