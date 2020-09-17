Rails.application.routes.draw do
  
  root 'index#home'
  
  devise_for :users

  resources :users
  resources :posts
  resources :commentaries, only: [:create]

  get 'search', to: "search#search", as: 'search'
  
  post 'like', to: 'likes#like', as: 'like'
  post 'unlike', to: 'likes#unlike', as: 'unlike'

  post 'follow', to: 'follow#follow_user', as: 'follow_user'
  post 'unfollow', to: 'follow#unfollow_user', as: 'unfollow_user'
  get 'follows', to: 'follow#index', as: 'index_follow_user'
  
  
end
