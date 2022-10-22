class OwnedBook < ApplicationRecord
    belongs_to :wishlist_item, :class_name => "WishlistItem", :foreign_key => "wishlist_item_id"


    validates :wishlist_item_id, uniqueness: true
end
