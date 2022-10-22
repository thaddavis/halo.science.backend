class MakeWishesPolymorphic < ActiveRecord::Migration[7.0]
  def change
    add_reference :wishlist_items, :thing, polymorphic: true, index: true
  end
end
