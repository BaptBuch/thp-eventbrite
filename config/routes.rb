Rails.application.routes.draw do
  get 'events/index'
  get 'static_pages/index'
  get 'static_pages/secret'

  root to: "events#index"

  resources :events 

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
