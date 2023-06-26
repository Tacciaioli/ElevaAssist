Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/page", to: "pages#page"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
