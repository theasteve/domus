Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :properties, shallow: true do
    resources :units
    resources :tenants
  end

  get "property_owners", to: "property_owners#index"
  post "property_owners", to: "property_owners#sign_in"
end
