Blogify::Application.routes.draw do

	devise_for :users, controllers: { registrations: "users/registrations" }

	namespace :users do 
    resources :settings, only: [ :edit, :update ]
  end
  
  resources :categories
  resources :comments
  resources :posts

  root 'posts#index'
end
