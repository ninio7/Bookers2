Rails.application.routes.draw do
  #get 'users/show'
  #get 'users/edit'
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #devise_for :books
 devise_for :users
 root to: "homes#top" 
 get "homes/about"=> "homes#about",as: "about"
 resources :books
 resources :users# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
