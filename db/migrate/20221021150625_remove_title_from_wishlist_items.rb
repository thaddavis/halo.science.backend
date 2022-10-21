class RemoveTitleFromWishlistItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :wishlist_items, :title, :string
  end
end
