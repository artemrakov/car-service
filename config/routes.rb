Rails.application.routes.draw do
  root to: 'pages#home'
  get 'thanks', to: 'pages#thanks'
  get 'find_us', to: 'pages#find_us'
  get 'prices', to: 'pages#prices'
  resources :bookings, only: [:new, :create]
end
