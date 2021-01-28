Rails.application.routes.draw do
  devise_for :users
  get 'albums/index'
  root to: "albums#index"
end
