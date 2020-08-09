Rails.application.routes.draw do
  
  get 'about'  => 'index#about'
  get 'login'  => 'index#login'
  root 'index#home'
  
end
