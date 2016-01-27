Rails.application.routes.draw do
  devise_for :users
  resources :resources, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :students, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :curriculums, only: [:index, :create]
    resources :lessons, only: [:index, :show ]
  end

  resources :curriculums, only: [:show, :update, :destroy] do
    resources :schedules, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :curriculums, only: [:index]
  resources :subjects, only: [:index, :new, :create]
  resources :unit_types, only: [:new, :create]
  resources :division_types, only: [:new, :create]


  root 'home#index'

end
