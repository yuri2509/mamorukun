Rails.application.routes.draw do
  devise_for :users
  root "audios#index"
  resources :delivery_traders
  resources :strangers
end
