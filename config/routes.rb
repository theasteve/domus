Rails.application.routes.draw do
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :properties, shallow: true do
    resources :units
  end

  resources :units, shallow: true do
    resources :rent_payments, only: [:edit, :update, :index]
    resources :tenants
  end
  
  resources :session, only: [:new, :create, :destroy]

  post "property_owners", to: "property_owners#sign_in"

  root to: "home#index"
end
