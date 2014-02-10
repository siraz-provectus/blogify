Blogify::Application.routes.draw do

	devise_for :users, controllers: { registrations: "users/registrations" }
  resources :categories
  resources :comments
  resources :posts

  root 'posts#index'
end
