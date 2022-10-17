Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/wishlist", to: "wishlist#index"

  delete "/wishlist_items/:id", to: "wishlist#delete_item"

  resources :books
end
