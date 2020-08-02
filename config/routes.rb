Rails.application.routes.draw do
  get 'signup' => 'users#new'
  get 'about'  => 'index#about'
  get 'login'  => 'index#login'
  root 'index#home'
  
end
