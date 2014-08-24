Rails.application.routes.draw do

  devise_for :users

  concern :voteable do
    resources :votes, only: :create
  end

  resources :posts, except: [:update, :edit], concerns: :voteable
  resources :comments, only: [:show, :create], concerns: :voteable

  resources :users, only: :show

  root 'posts#index'
end
