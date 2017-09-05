Rails.application.routes.draw do
  root "home#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/dashboard", to: "dashboard#show"
  resources :home

  mount ActionCable.server => '/cable'

  resources :tone
end
