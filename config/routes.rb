Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :articles
  resources :items do
  end
  resources :users, only: :show
end
