Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :products
  resources :cart_products, only: [:create, :destroy]

  get 'cart', to: 'carts#show'
  post 'checkout', to: 'carts#checkout'
  put 'cart/clear', to: 'carts#clear'
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"

end
