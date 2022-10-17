class WishlistItem < ApplicationRecord
    belongs_to :wishlist
    belongs_to :book, class_name: "Book", foreign_key: "book_id"
end
