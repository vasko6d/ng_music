Rails.application.routes.draw do

  resources :users, :albums, :singers
  root :to => "sessions#login"

  match "signup", :to => "users#new" , via: [:get]
  match "login", :to => "sessions#login", via: [:get]
  match "logout", :to => "sessions#logout", via: [:get]
  match "home", :to => "sessions#home", via: [:get]
  match "profile", :to => "sessions#profile", via: [:get]
  match "setting", :to => "sessions#setting", via: [:get]

  #default route
  match ':controller(/:action(/:id))(.:format)', via: [:get, :post]
end
