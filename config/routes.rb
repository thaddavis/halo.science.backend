Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/wishlists", to: "wishlists#index"
  delete "/wishlist_items/:id", to: "wishlists#delete_item"
  post "/wishlist_items", to: "wishlists#add_item"

  resources :books
  resources :owned_wishes
  resources :readings

  post "/search_readings", to: "books#search_readings"
  get "/users/give_away_possessions/:user_id", to: "users#give_away_possessions"
end
