Rails.application.routes.draw do
  get 'transactions/index'
  get 'transactions/new'
  get 'transactions/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "transferts#index"
   resources :transferts do
    collection do
      get :envois, to: 'transferts#index', defaults: { type: 'envoi' }
      get :retraits, to: 'transferts#index', defaults: { type: 'retrait' }
    end
  end
end
