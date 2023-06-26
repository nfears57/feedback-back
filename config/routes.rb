Rails.application.routes.draw do
  resources :admins
  resources :applications, only: [:create, :show]
  resources :jobs, only: [:index]
  resources :users, only: [:index, :show, :create, :update, :destroy]

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  delete '/delete_account', to: 'sessions#delete_account', as: 'delete_account'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
