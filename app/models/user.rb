class User < ApplicationRecord
    has_many :wishlist_items, through: :wishlist
    has_one :wishlist
end
