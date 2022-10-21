class AddWishlistItemToOwnedBook < ActiveRecord::Migration[7.0]
  def change
    add_column :owned_books, :wishlist_item_id, :integer
  end
end
