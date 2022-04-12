Rails.application.routes.draw do
  resources :examples
  devise_for :users

  get '/products/:displayname', to: 'products#show'
  resource :spreadsheet, only: [:edit, :update]
  get '/upload', to: 'spreadsheets#edit'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
