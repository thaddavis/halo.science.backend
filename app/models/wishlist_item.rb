class WishlistItem < ApplicationRecord
    belongs_to :wishlist
    belongs_to :book, class_name: "Book", foreign_key: "book_id"
    belongs_to :author, class_name: "Author", foreign_key: "author_id"
    has_one :owned_book, class_name: "OwnedBook", dependent: :destroy
end
