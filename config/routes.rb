Rails.application.routes.draw do
  root to: "exames#index"
  devise_for :users
  resources 'exames', except: [:show, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
