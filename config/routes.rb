Rails.application.routes.draw do
  
  
  devise_for :users
  
  resources :posts
  resources :commentaries, only: [:create]
  post 'follow', to: 'follow#follow_user', as: 'follow_user'
  post 'unfollow', to: 'follow#unfollow_user', as: 'unfollow_user'
  get 'follows', to: 'follow#index', as: 'index_follow_user'
  root 'index#home'
  resources :users

  

  

  
end
