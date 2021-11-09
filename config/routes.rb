Rails.application.routes.draw do
  root 'institutional/home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  namespace :admins do
    get '', controller: :dashboard, action: :index, as: :dashboard
    resources :auctions do
      resources :auction_pictures, only: [:index, :show, :create, :destroy], path: 'pictures'
    end
    resources :clients
    resources :settings do
      post '', action: :update, on: :collection
    end
  end
end
