Rails.application.routes.draw do
  resources :article_categories
  resources :categories
  resources :articles
  resources :users, except: [:new]

  get "/", to: "pages#home"
  get "signup", to: "users#new"
  get "login", to: "sessions#new" 
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
