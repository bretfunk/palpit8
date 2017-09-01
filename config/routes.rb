Rails.application.routes.draw do
  root "home#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/dashboard", to: "dashboard#show"
  resources :home
  get "/refresh_part", to: "home#refresh_part"
end
