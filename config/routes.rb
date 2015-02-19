Rails.application.routes.draw do
  root to: 'students#index'

  resources :students, only: [:new, :create, :index, :show]
  resources :courses, only: [:new, :create, :index]
  resources :enrollments, only: [:new, :create]
end
