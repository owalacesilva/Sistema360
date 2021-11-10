Rails.application.routes.draw do
  root 'institutional/home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  namespace :backoffice do
    get '', controller: :dashboard, action: :index, as: :dashboard
    resources :newsletters
    resources :events
    resources :registration
    resources :tickets
    
    namespace :tree do
      resources :sponsored
      resources :team
    end
  end
end
