class RemoveBookIdFromOwnedBook < ActiveRecord::Migration[7.0]
  def change
    remove_column :owned_books, :book_id, :integer
  end
end
