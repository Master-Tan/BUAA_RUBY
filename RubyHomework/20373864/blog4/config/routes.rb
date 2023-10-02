Rails.application.routes.draw do
  # resources :users
  # resources :comments

  root :to => 'blogs#index'

  resources :blogs do
    resources :comments
  end

  resources :users do
    collection do
      get 'login'
      post 'do_login'
      get 'logout'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
