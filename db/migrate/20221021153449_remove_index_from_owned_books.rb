class RemoveIndexFromOwnedBooks < ActiveRecord::Migration[7.0]
  def change
    remove_index :owned_books, name: "index_owned_books_on_user_id_and_book_id"
  end
end
