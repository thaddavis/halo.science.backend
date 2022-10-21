class RemoveColumnFromOwnedBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :owned_books, :wishlist_item_id, :integer
  end
end
