class AddUniqueIndexToOwnedBooks < ActiveRecord::Migration[7.0]
  def change
    add_index :owned_books, [:user_id, :book_id], unique: true
  end
end
