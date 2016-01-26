Rails.application.routes.draw do
  devise_for :models
  resources :resources, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :students, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :curriculums, only: [:index, :create]
    resources :lessons, only: [:index, :show ]
  end

  resources :curriculums, only: [:show, :update, :destroy] do
    resources :schedules, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :curriculums, only: [:index]

  root 'homes#index'

end
