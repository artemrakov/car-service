Rails.application.routes.draw do
  root to: 'pages#home'
  resources :booking, only: [:new, :create]
end
