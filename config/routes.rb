Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  } 

  root "audios#index"
  resources :delivery_traders
  resources :strangers
  resources :users
end
