Rails.application.routes.draw do
  resources :strippers, only: [:index, :show, :update, :edit] do
    resources :bookings, only: [ :new, :create, :destroy, :show, :index ]
  end
  
  devise_for :strippers
  devise_for :users
  root to: 'strippers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
