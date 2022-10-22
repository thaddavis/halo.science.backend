class RenameWishlistItemToWish < ActiveRecord::Migration[7.0]
  def self.up
    rename_table :wishlist_items, :wishes
  end

  def self.down
    rename_table :wishes, :wishlist_items
  end
end
