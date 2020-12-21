Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  root 'top#index'
  resources :posts, only: [:new, :create] do
    resources :messages, only: [:index, :create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
end
