Rails.application.routes.draw do
  devise_for :users
  get 'top/index'
  root 'top#index'
  resources :posts
  resources :messages
  resources :users, only: [:show]
end
