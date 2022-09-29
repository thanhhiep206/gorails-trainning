Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 root to: "main#index"
 get "about-us", to: "about#index" , as: :about

 #user
 get "signup", to: "register#new" 
 get "signin" , to: "session#new"
 post "signin" , to: "session#create"
 delete "logout", to: "session#destroy"
 post "signup", to: "register#create"

 #password
 get "password", to: "password#edit" , as: :edit_password
 patch "password", to: "password#update"
end
