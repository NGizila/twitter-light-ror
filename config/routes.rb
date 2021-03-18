Rails.application.routes.draw do
  root "user#index"

  get "/user", to: "user#index"
  get "/user/new", to: "user#new"

  resources :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
