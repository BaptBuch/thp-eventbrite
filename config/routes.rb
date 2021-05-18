Rails.application.routes.draw do
  # get 'user/show'
  # get 'events/index'
  # get 'static_pages/index'
  # get 'static_pages/secret'

  root to: "events#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resources :events 


  

  resources :users, only: [:show, :index, :edit, :update]
end
