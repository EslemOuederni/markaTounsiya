Rails.application.routes.draw do
  get "pages/home"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :companies do
    resources :products
  end
  # Defines the root path route ("/")
  root "pages#home"
end
