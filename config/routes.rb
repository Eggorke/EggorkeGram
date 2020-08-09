Rails.application.routes.draw do
  
  devise_for :users
  get 'about'  => 'index#about'
  root 'index#home'
  
end
