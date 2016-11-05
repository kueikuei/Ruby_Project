Rails.application.routes.draw do
  resources :orders
  # get '/search_orders', to:'orders#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #自己定義URL
  # get '/search_orders' ,to 'orders#index'





end
