Rails.application.routes.draw do
  root "home#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/dashboard", to: "dashboard#show"

  namespace :admin do
    resources :games
    resources :chatrooms
  end

  resources :messages
  resources :chatrooms, param: :slug
  resources :games, param: :slug,  only: [:index, :show]

  mount ActionCable.server => '/cable'
end
