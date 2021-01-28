Rails.application.routes.draw do
  devise_for :users
  root to: "albums#index"
  resources :albums, only: [:new, :create]
end
