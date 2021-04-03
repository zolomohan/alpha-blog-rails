Rails.application.routes.draw do
  resources :articles
  resources :users, except: [:new]
  get "signup", to: "users#new"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
