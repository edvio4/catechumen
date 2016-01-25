Rails.application.routes.draw do
  resources :resources, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :students, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :curriculums, only: [:index, :create]
  end

  resources :curriculums, only: [:show, :update, :destroy] do
    resources :lessons, only: [:index, :show]
    resources :schedules, only: [:new, :create, :edit, :update, :destroy]
  end

  root 'students#index'

end
