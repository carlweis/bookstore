Rails.application.routes.draw do
  get 'store/index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :products

  # Root url
  root 'store#index', as: 'store'
end
