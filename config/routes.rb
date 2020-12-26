Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  } 

  root "audios#index"
  resources :delivery_traders
  resources :strangers
  resources :users

  # get 'users/show', to: 'users#show'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
