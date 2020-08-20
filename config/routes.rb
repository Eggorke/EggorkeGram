Rails.application.routes.draw do
  
  get 'posts/new'

  devise_for :users
  get 'about'  => 'index#about'
  root 'index#home'
  resources :posts

  
end
