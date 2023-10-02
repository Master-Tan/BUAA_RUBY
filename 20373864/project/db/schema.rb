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

ActiveRecord::Schema[7.0].define(version: 2022_12_31_182817) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "administrator_logs", force: :cascade do |t|
    t.integer "administrator_id", null: false
    t.string "action"
    t.string "detail"
    t.integer "status"
    t.time "add_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrator_id"], name: "index_administrator_logs_on_administrator_id"
  end

  create_table "administrators", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "authentication_token"
  end

  create_table "api_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "canteens", force: :cascade do |t|
    t.string "canteen_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "authentication_token"
    t.string "password"
    t.index ["canteen_name"], name: "index_canteens_on_canteen_name", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.integer "sum_price"
    t.time "added_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_cart_items_on_product_id"
    t.index ["user_id"], name: "index_cart_items_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "content"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_comments_on_shop_id"
  end

  create_table "deliver_logs", force: :cascade do |t|
    t.integer "deliver_id", null: false
    t.string "action"
    t.string "detail"
    t.integer "status"
    t.time "add_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deliver_id"], name: "index_deliver_logs_on_deliver_id"
  end

  create_table "delivers", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "authentication_token"
  end

  create_table "delivery_addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "phone"
    t.boolean "default"
    t.string "building"
    t.integer "floor"
    t.string "complete_address"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_delivery_addresses_on_user_id"
  end

  create_table "delivery_orders", force: :cascade do |t|
    t.integer "transaction_order_id", null: false
    t.string "added_time"
    t.string "arrival_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "deliver"
    t.index ["transaction_order_id"], name: "index_delivery_orders_on_transaction_order_id"
  end

  create_table "help_delivery_items", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "detail"
    t.integer "help_delivery_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["help_delivery_order_id"], name: "index_help_delivery_items_on_help_delivery_order_id"
    t.index ["user_id"], name: "index_help_delivery_items_on_user_id"
  end

  create_table "help_delivery_order_platforms", force: :cascade do |t|
    t.integer "help_delivery_order_id", null: false
    t.time "add_time"
    t.string "image_directory"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["help_delivery_order_id"], name: "index_help_delivery_order_platforms_on_help_delivery_order_id"
  end

  create_table "indices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_platforms", force: :cascade do |t|
    t.integer "transaction_order_id", null: false
    t.time "add_time"
    t.string "image_directory"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_order_id"], name: "index_order_platforms_on_transaction_order_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "product_name"
    t.decimal "retail_price"
    t.integer "favorites"
    t.integer "sales"
    t.text "description"
    t.string "image_directory"
    t.string "product_type"
    t.time "added_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "taste"
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "shop_logs", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "action"
    t.string "detail"
    t.integer "status"
    t.time "add_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_shop_logs_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "phone"
    t.time "open_time"
    t.time "close_time"
    t.string "address"
    t.integer "canteen_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "authentication_token"
    t.string "image_directory"
    t.index ["canteen_id"], name: "index_shops_on_canteen_id"
  end

  create_table "transaction_items", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.decimal "price"
    t.integer "transaction_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_transaction_items_on_product_id"
    t.index ["transaction_order_id"], name: "index_transaction_items_on_transaction_order_id"
    t.index ["user_id"], name: "index_transaction_items_on_user_id"
  end

  create_table "transaction_orders", force: :cascade do |t|
    t.time "added_time"
    t.integer "user_id", null: false
    t.integer "shop_id", null: false
    t.string "delivery_address"
    t.string "delivery_phone"
    t.string "order_status"
    t.decimal "delivery_money"
    t.decimal "packing_money"
    t.decimal "discount_money"
    t.decimal "pay_money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_help"
    t.index ["shop_id"], name: "index_transaction_orders_on_shop_id"
    t.index ["user_id"], name: "index_transaction_orders_on_user_id"
  end

  create_table "user_logs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "action"
    t.string "detail"
    t.integer "status"
    t.time "add_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_logs_on_user_id"
  end

  create_table "user_search_records", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "content"
    t.time "add_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_search_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token"
    t.string "password_digest"
    t.string "address"
    t.string "email"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "administrator_logs", "administrators"
  add_foreign_key "cart_items", "products"
  add_foreign_key "cart_items", "users"
  add_foreign_key "comments", "shops"
  add_foreign_key "deliver_logs", "delivers"
  add_foreign_key "delivery_addresses", "users"
  add_foreign_key "delivery_orders", "transaction_orders"
  add_foreign_key "help_delivery_items", "help_delivery_orders"
  add_foreign_key "help_delivery_items", "users"
  add_foreign_key "help_delivery_order_platforms", "help_delivery_orders"
  add_foreign_key "order_platforms", "transaction_orders"
  add_foreign_key "products", "shops"
  add_foreign_key "shop_logs", "shops"
  add_foreign_key "shops", "canteens"
  add_foreign_key "transaction_items", "products"
  add_foreign_key "transaction_items", "transaction_orders"
  add_foreign_key "transaction_items", "users"
  add_foreign_key "transaction_orders", "shops"
  add_foreign_key "transaction_orders", "users"
  add_foreign_key "user_logs", "users"
  add_foreign_key "user_search_records", "users"
end
