Rails.application.routes.draw do
  root "home#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/dashboard", to: "dashboard#show"

  resources :messages
  resources :chatrooms, param: :slug

  mount ActionCable.server => '/cable'
end
