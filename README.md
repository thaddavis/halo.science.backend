rails generate migration RemoveTitleFromWishlistItems title:string

rails generate migration AddWishlistItemToOwnedBook wishlist_item_id:integer

rails g migration AddUniqueIndexToOwnedBooks

rails db:migrate

rails db:rollback STEP=1

reload!

docker build -t thaddavis/ruby-docker .

docker run -d -p 3000:3000 thaddavis/ruby-docker

docker push thaddavis/ruby-docker:v10