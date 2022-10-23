rails generate migration RemoveTitleFromWishlistItems title:string

rails generate migration AddWishlistItemToOwnedBook wishlist_item_id:integer

rails g migration AddUniqueIndexToOwnedBooks

rails db:migrate

rails db:rollback STEP=1

reload!