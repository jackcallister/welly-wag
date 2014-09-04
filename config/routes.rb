Rails.application.routes.draw do

  devise_for :users

  concern :voteable do
    resources :votes, only: :create
  end

  resources :posts, concerns: :voteable
  resources :comments, only: [:show, :create], concerns: :voteable
  delete :notifications, to: 'notifications#destroy'

  resources :users, only: :show

  root 'posts#index'
end
