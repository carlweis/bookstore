Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  get 'store/index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :products

  # Root url
  root 'store#index', as: 'store'
end
