Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :orders
  resources :line_items
  resources :carts
  get 'store/index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :products do
    get :who_bought, on: :member
  end

  # Root url
  root 'store#index', as: 'store'
end
