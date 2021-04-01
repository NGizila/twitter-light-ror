Rails.application.routes.draw do
  resources :tweets
  resources :users
  root "users#index"

  get "/users", to: "user#index"
  get "/users/new", to: "users#new"

  resources :users do
	resources :tweets
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
