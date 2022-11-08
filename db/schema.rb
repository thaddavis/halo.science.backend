# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_22_232423) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.integer "author_id"
    t.integer "page_length"
    t.string "genre"
    t.integer "supply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "owned_wishes", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wish_id"
    t.index ["wish_id"], name: "index_owned_wishes_on_wish_id", unique: true
  end

  create_table "readings", force: :cascade do |t|
    t.integer "book_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishes", force: :cascade do |t|
    t.integer "wishlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thing_type"
    t.bigint "thing_id"
    t.index ["thing_type", "thing_id"], name: "index_wishlist_items_on_thing"
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
