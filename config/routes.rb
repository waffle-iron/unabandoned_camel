Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#dashboard"

  resources :beans, only: [ :index ]
<<<<<<< HEAD

  resources :cart
=======
  get '/:category_name', to: 'categories#show', as: 'category'
>>>>>>> 4baaa272c65f51fa956c38a552b8bb031276ccb0
end
