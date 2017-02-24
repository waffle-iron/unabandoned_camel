Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#dashboard"

  resources :beans, only: [ :index, :show ]

  resources :categories, only: [:index]

  resources :cart

  resources :users, only: [:new, :create]

  resources :sessions, only: [:destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'

  get '/:category_name', to: 'categories#show', as: 'category'


end
