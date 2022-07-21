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

ActiveRecord::Schema.define(version: 2022_07_21_020046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.float "price"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shop_id"
    t.bigint "user_id"
    t.index ["author"], name: "index_books_on_author"
    t.index ["created_at"], name: "index_books_on_created_at"
    t.index ["name"], name: "index_books_on_name"
    t.index ["price"], name: "index_books_on_price"
    t.index ["quantity"], name: "index_books_on_quantity"
    t.index ["shop_id"], name: "index_books_on_shop_id"
    t.index ["updated_at"], name: "index_books_on_updated_at"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "order_detail"
    t.bigint "shop_id"
    t.bigint "user_id"
    t.index ["created_at"], name: "index_orders_on_created_at"
    t.index ["order_detail"], name: "index_orders_on_order_detail"
    t.index ["shop_id"], name: "index_orders_on_shop_id"
    t.index ["updated_at"], name: "index_orders_on_updated_at"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address"], name: "index_shops_on_address"
    t.index ["created_at"], name: "index_shops_on_created_at"
    t.index ["name"], name: "index_shops_on_name"
    t.index ["updated_at"], name: "index_shops_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["password"], name: "index_users_on_password"
    t.index ["updated_at"], name: "index_users_on_updated_at"
  end

  add_foreign_key "books", "shops"
  add_foreign_key "books", "users"
  add_foreign_key "orders", "shops"
  add_foreign_key "orders", "users"
end
