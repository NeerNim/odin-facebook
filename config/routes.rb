# frozen_string_literal: true

Rails.application.routes.draw do
  get 'friendships/new'
  get 'friendships/index'
  get 'friendships/show'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :users, only: [:new, :create, :show, :index]
  resources :posts do
    resources :likes
    resources :comments
  end
  resources :friendships
end
