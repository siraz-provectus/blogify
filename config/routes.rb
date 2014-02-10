Blogify::Application.routes.draw do

	devise_for :users
  resources :categories
  resources :comments
  resources :posts

  root 'posts#index'
end
