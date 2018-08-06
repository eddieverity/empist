Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  get 'users/signin' => 'users#signin'
  post 'users/create'
  get 'users/logout'
  post 'users/login'
end
