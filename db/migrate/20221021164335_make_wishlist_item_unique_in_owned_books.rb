class MakeWishlistItemUniqueInOwnedBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :owned_books, :wishlist_item_id, :integer
    add_index :owned_books, :wishlist_item_id, unique: true
  end
end
