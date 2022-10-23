class OwnedWish < ApplicationRecord
    belongs_to :wish, :class_name => "Wish", :foreign_key => "wish_id"

    belongs_to :user

    validates :wish_id, uniqueness: true

    after_save :update_wishlist
    after_destroy :update_wishlist

    def update_wishlist
        self.wish.wishlist.touch
    end
end
