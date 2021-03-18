Rails.application.routes.draw do
  resources :users
  root "users#index"

  get "/users", to: "user#index"
  get "/users/new", to: "users#new"

  resources :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
