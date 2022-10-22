class RenameOwnedBookToOwnedWish < ActiveRecord::Migration[7.0]
  def self.up
    rename_table :owned_books, :owned_wishes
  end

  def self.down
    rename_table :owned_wishes, :owned_books
  end
end
