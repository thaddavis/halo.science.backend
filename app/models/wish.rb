class Wish < ApplicationRecord
    belongs_to :wishlist
    belongs_to :thing, polymorphic: true
    has_one :owned_book, class_name: "OwnedBook", dependent: :destroy

    after_save :update_wishlist

    def update_wishlist
        self.wishlist.touch
    end
end
