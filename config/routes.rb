Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :agencies do
    resources :guichets
  end
  resources :historicals
  # Defines the root path route ("/")

   resources :transferts do
    collection do
      get :sending, to: 'transferts#index', defaults: { type: 'sending' }
    end
   end

  root "home#index"
  resources :countries do
    resources :cities, only: [:new, :create]
  end
end
