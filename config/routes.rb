Rails.application.routes.draw do
  root 'home#dashboard'
  get 'account/login'
  get 'account/signup'
  post 'account/signup'
  post 'account/login'
  get 'account/logout'

  


  get 'password/forget_password'
  get 'password/reset_password'
  
  post 'password/forget_password'
  post 'password/reset_password'



  get 'profile/edit_profile'
  post 'profile/edit_profile'

  get 'home/dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
