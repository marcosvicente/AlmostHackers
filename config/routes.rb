Rails.application.routes.draw do
  devise_for :users
  root to: "exames#index"
  resources 'exames', except: [:show, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
