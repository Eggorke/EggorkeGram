Rails.application.routes.draw do
  
  
  devise_for :users
  
  resources :posts

  root 'index#home'

  
end
