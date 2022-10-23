class User < ApplicationRecord
    has_one :wishlist
    has_many :wishes, through: :wishlist
    has_many :owned_wishes, through: :wishes
    has_many :readings
end
