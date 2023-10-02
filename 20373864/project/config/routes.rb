Rails.application.routes.draw do
  resources :indices
  get "weather", to: "weathers#show"

  post "user_refer", to: "recommendations#create"
  # config/routes.rb
  get "/rails/active_storage/disk/:id", to: "images#show", as: :image

  post 'canteen_login', to: 'canteens#login'
  get 'canteen_logout', to: 'canteens#logout'
  get 'current_canteens', to: 'canteens#get_current_canteen'

  # post 'login', to: :login, controller: 'api/sessions'

  post 'login', to: 'api/sessions#login'
  get 'logout', to: 'api/sessions#logout'
  get 'current_user', to: 'api/sessions#get_current_user'
  post 'register', to: 'api/sessions#register'
  patch 'update_user', to: 'api/sessions#update_user'
  delete 'drop_user', to: 'api/sessions#drop_user'

  post 'shop_login', to: 'shops#login'
  get 'shop_logout', to: 'shops#logout'
  get 'current_shop', to: 'shops#get_current_shop'
  post 'shop_register', to: 'shops#register'
  patch 'update_shop', to: 'shops#update_shop'
  delete 'drop_shop', to: 'shops#drop_shop'

  post 'deliver_login', to: 'delivers#login'
  get 'deliver_logout', to: 'delivers#logout'
  get 'current_deliver', to: 'delivers#get_current_deliver'
  post 'deliver_register', to: 'delivers#register'
  patch 'update_deliver', to: 'delivers#update_deliver'
  delete 'drop_deliver', to: 'delivers#drop_deliver'

  post 'admin_login', to: 'administrators#login'
  get 'admin_logout', to: 'administrators#logout'
  get 'current_admin', to: 'administrators#get_current_administrator'
  post 'admin_register', to: 'administrators#register'
  patch 'update_admin', to: 'administrators#update_administrator'
  delete 'drop_admin', to: 'administrators#drop_administrator'

  get 'manage', to: "indices#manage"

  namespace :api do
    resources :sessions, only: [:create]
  end

  resources :comments
  resources :administrator_logs
  resources :deliver_logs
  resources :shop_logs
  resources :user_logs
  resources :administrators
  resources :user_search_records
  resources :delivery_orders
  resources :help_delivery_order_platforms
  resources :help_delivery_items
  resources :delivery_addresses
  resources :order_platforms
  resources :transaction_items
  resources :transaction_orders
  resources :cart_items
  resources :products
  resources :delivers
  resources :shops
  resources :canteens
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "users#index"
  # root to: redirect('http://101.42.44.236:5173/')
  root to: "indices#index"
end
