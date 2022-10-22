class WishlistItem < ApplicationRecord
    belongs_to :wishlist
    belongs_to :thing, polymorphic: true
    has_one :owned_book, class_name: "OwnedBook", dependent: :destroy
end
