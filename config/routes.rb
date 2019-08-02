Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index]

  resources :posts

  root to: "posts#index"
  
end
