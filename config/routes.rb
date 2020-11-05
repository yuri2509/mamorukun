Rails.application.routes.draw do
  root "audios#index"
  resources :delivery_traders
  resources :strangers
end
