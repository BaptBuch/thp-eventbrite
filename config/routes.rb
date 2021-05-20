Rails.application.routes.draw do

  root to: "events#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :index, :edit, :update] do
    resources :avatars, only: [:create]
  end

  resources :charges

  resources :events do
    resources :attendances
    resources :pictures, only: [:create]
  end
end
