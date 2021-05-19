Rails.application.routes.draw do

  root to: "events#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events 

  resources :users, only: [:show, :index, :edit, :update]

  # get 'charges/new'
  # get 'charges/create'

  resources :charges

  resources :events do
    resources :attendances
  end
end
