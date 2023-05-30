Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#show'

  resources :posts
  resources :users, only: [:new, :create, :index, :show]
  get "/signup", to: "users#new", as: 'signup'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
end
