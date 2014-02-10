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

  resources :tags, only: [] do
    collection do
      get :autocomplete
    end
  end 

  root 'posts#index'
end
