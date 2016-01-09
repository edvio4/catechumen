Rails.application.routes.draw do
  resources :students, only: [:index, :show, :create, :update, :destroy]

  root 'students#index'
end
