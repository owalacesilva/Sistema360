Rails.application.routes.draw do
  root "institutional/home#index"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }

  namespace :backoffice do
    get "", controller: :dashboard, action: :index, as: :dashboard
    resources :newsletters
    resources :events
    resources :supplies
    resources :registration
    resources :tickets

    namespace :tree do
      resources :sponsored
      resources :team
    end

    namespace :financial do
      resources :detailed_extract
      resources :withdraw
    end

    namespace :reports do
      resources :points
      resources :referral
      resources :team
    end

    namespace :profile do
      get "user_data", controller: :user_data, action: :index, as: :user_data
      post "user_data", controller: :user_data, action: :update, as: :update_user_data

      get "banking_account", controller: :banking_account, action: :index, as: :banking_account
      post "banking_account", controller: :banking_account, action: :update, as: :update_banking_account
    end

    namespace :store do
      resources :products, only: [:index, :show]
      resources :orders, only: [:index, :show, :destroy]
      resources :cart_items, only: [:create, :add_quantity, :reduce_quantity, :destroy] do
        post :add_quantity, on: :member
        post :reduce_quantity, on: :member
      end
      get "shipping", controller: :shipping, action: :index, as: :shipping
      get "cart", controller: :cart, action: :show, as: :cart
      get "confirmation", controller: :confirmation, action: :index, as: :confirmation
      get "checkout", controller: :checkout, action: :index, as: :checkout
    end
  end
end
