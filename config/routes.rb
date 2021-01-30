Rails.application.routes.draw do
  devise_for :users
  root to: "albums#index"
  
  resources :albums, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create]
  end
end
