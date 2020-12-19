Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :user, only: [:edit, :update]
  resources :items, only: [:index, :new, :create, :show]
end
