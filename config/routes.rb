Rails.application.routes.draw do
  root to: 'pages#home'
  get 'find_us', to: 'pages#find_us'
  resources :bookings, only: [:new, :create]
end
