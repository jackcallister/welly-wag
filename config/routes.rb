Rails.application.routes.draw do

  devise_for :users

  resources :posts, except: [:update, :edit]
  resources :votes, only: :create
  resources :users, only: :show

  root 'posts#index'
end
