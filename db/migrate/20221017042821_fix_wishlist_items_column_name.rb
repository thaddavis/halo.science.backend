class FixWishlistItemsColumnName < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :wishlist_items, :user_id, :wishlist_id
  end

  def self.down
    rename_column :wishlist_items, :wishlist_id, :user_id
  end
end
