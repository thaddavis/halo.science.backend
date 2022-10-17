class CreateOwnedBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :owned_books do |t|
      t.integer :user_id
      t.string :book_id

      t.timestamps
    end
  end
end
