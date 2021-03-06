Rails.application.routes.draw do
  resources :kinds
  resources :auths, only: [:create]
  
  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'

    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relationships/phones'
    resource :phone, only: [:create, :update, :destroy]
    resource :phone, only: [:create, :update, :destroy], path: 'relationships/phone'

    resource :address, only: [:show, :update, :create, :destroy]
    resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
  end
  
  root "contacts#index"
end
