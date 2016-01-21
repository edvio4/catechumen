Rails.application.routes.draw do
  resources :resources, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :students, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :curriculums, only: [:index, :show, :create, :destroy]
  end

  resources :curriculums, only: [] do
    resources :lessons, only: [:destroy]
  end

  root 'students#index'

end
