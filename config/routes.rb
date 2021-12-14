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
    end

    namespace :reports do
      resources :points
      resources :referral
    end

    namespace :store do
      resources :products, only: [:index, :show]
      get "shipping", controller: :shipping, action: :index, as: :shipping
      get "cart", controller: :cart, action: :index, as: :cart
      get "confirmation", controller: :confirmation, action: :index, as: :confirmation
      get "checkout", controller: :checkout, action: :index, as: :checkout
    end
  end
end
