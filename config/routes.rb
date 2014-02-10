Blogify::Application.routes.draw do
  resources :categories
  resources :comments
  resources :posts

  root 'posts#index'
end
