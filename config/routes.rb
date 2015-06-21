Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :houses
  resources :house_rental_requests

  root to: "sessions#new"
end
