class User < ApplicationRecord
    has_many :wishes, through: :wishlist
    has_one :wishlist
end
