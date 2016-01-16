Rails.application.routes.draw do
  resources :vendors, only: [:create, :show]
  resources :products, only: [:create, :index, :show]
  resources :users, only: [:create, :index, :show]
  resources :stores, only: [:create, :show]
end