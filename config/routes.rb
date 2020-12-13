Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  get 'top/index'
  root 'top#index'
  resources :posts, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
  resources :users, only: [:show]
end
