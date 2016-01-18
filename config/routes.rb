Rails.application.routes.draw do
  resources :students, only: [:new, :index, :show, :create, :update, :destroy]
  resources :resources, only: [:new, :index, :show, :create, :update, :destroy]

  root 'students#index'

end
