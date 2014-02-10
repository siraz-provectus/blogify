Blogify::Application.routes.draw do

	devise_for :users, controllers: { registrations: "users/registrations" }

	namespace :users do 
    resources :settings, only: [ :edit, :update ]
  end
  
  resources :categories do
    member do
      get :load_subcategories
    end
  end
  resources :comments
  resources :posts

  root 'posts#index'
end
