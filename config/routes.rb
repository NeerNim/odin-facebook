# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } 
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
      resources :friendships
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
  resources :friendships, only: [:new, :index, :show]
  get 'notifications/new'
end
