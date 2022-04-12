Rails.application.routes.draw do
  resources :examples
  devise_for :users

  resource :experiment, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
