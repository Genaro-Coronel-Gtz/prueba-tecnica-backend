Rails.application.routes.draw do
  resources :people
  resources :logs, only: [:index]
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end