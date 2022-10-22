class OwnedBook < ApplicationRecord
    belongs_to :wish, :class_name => "Wish", :foreign_key => "wish_id"

    validates :wish_id, uniqueness: true
end
