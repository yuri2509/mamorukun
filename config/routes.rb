Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  } 

  root "audios#index"
  resources :delivery_traders, only: [:index]
  resources :strangers, only: [:index]
  resources :users, only: [:new, :create, :edit, :update]
  resources :messages, only: [:index, :create, :destroy]

  # get 'users/show', to: 'users#show'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
