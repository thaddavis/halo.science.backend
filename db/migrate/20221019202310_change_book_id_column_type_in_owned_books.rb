class ChangeBookIdColumnTypeInOwnedBooks < ActiveRecord::Migration[7.0]
  def up
    change_table :owned_books do |t|
      t.change :book_id, :integer
    end
  end

  def down
    change_table :owned_books do |t|
      t.change :book_id, :string
    end
  end
end
