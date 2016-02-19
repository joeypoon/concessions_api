Rails.application.routes.draw do
  namespace :api do

    namespace :v010 do
      resources :orders, only: [:create, :show, :update]
      resources :vendors, only: [:create, :show]
      resources :products, only: [:create, :index, :show]

      resources :users, only: [:create, :index, :show] do
        get 'orders', on: :member
      end

      resources :stores, only: [:create, :show, :index] do
        get 'orders', on: :member
      end
    end

  end
end