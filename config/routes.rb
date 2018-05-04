Rails.application.routes.draw do
  get 'strippers/index'
  
  resources :strippers, only: [ :index, :show] do
    resources :bookings, only: [ :new, :create]
  end
  resources :bookings, only: [ :destroy, :show, :index]
  
  devise_for :strippers
  devise_for :users
  root to: 'strippers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
