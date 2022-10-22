class UpdateColumnInOwnedBooks < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :owned_books, :wishlist_item_id, :wish_id
  end

  def self.down
    rename_column :owned_books, :wish_id, :wishlist_item_id
  end
end
