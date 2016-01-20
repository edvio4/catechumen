Rails.application.routes.draw do
  resources :resources, only: [:new, :index, :show, :create, :update, :destroy]

  resources :students, only: [:new, :index, :show, :create, :update, :destroy] do
    resources :curriculums, only: [:index, :show, :create, :update, :destroy]
  end


  root 'students#index'

end
