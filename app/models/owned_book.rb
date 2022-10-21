class OwnedBook < ApplicationRecord
    belongs_to :book, :class_name => "Book", :foreign_key => "book_id"
    belongs_to :wishlist_item, :class_name => "WishlistItem", :foreign_key => "wishlist_item_id"
    # wishlist_item_id
end
