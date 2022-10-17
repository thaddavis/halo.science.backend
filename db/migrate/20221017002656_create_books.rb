class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.integer :author_id
      t.integer :page_length
      t.string :genre
      t.integer :supply

      t.timestamps
    end
  end
end
