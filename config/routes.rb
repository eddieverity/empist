Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  get 'users/signin' => 'users#signin'
  post 'users/create'
  get 'users/logout'
  post 'users/login'

  get 'drinks' => 'drinks#index'

  patch 'drinks/edit/:order_id' => 'drinks#update'

  post 'drinks/order/:user_id' => 'drinks#order'

  post 'drinks/delete/:order_id' => 'drinks#delete'

  post 'drinks/accept/:order_id' => 'drinks#accept'

  post 'drinks/deny/:order_id' => 'drinks#deny'

  post 'drinks/status/:order_id' => 'drinks#status'

end
