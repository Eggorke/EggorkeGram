Rails.application.routes.draw do
  
  
  devise_for :users
  
  resources :posts
  resources :commentaries, only:[:create]

  root 'index#home'

  
end
