class AddTitleToWishlistItems < ActiveRecord::Migration[7.0]
  def change
    add_column :wishlist_items, :title, :string
    add_column :wishlist_items, :author_id, :integer
  end
end
