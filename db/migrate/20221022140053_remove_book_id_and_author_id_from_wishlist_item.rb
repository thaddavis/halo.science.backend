class RemoveBookIdAndAuthorIdFromWishlistItem < ActiveRecord::Migration[7.0]
  def change
    remove_column :wishlist_items, :book_id, :integer
    remove_column :wishlist_items, :author_id, :integer
  end
end
