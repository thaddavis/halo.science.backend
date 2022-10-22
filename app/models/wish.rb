class Wish < ApplicationRecord
    belongs_to :wishlist
    belongs_to :thing, polymorphic: true
    has_one :owned_wish, class_name: "OwnedWish", dependent: :destroy

    after_save :update_wishlist
    after_destroy :update_wishlist

    def update_wishlist
        self.wishlist.touch
    end
end
