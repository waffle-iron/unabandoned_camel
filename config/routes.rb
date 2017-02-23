Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#dashboard"

  resources :beans, only: [ :index ]


  resources :cart

  get '/:category_name', to: 'categories#show', as: 'category'

end
