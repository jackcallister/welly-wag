Rails.application.routes.draw do

  devise_for :users

  resources :posts, except: [:update, :edit]
  resources :votes, only: :create

  root 'posts#index'
end
