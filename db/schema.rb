# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170228235513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bean_categories", force: :cascade do |t|
    t.integer "bean_id"
    t.integer "category_id"
    t.index ["bean_id"], name: "index_bean_categories_on_bean_id", using: :btree
    t.index ["category_id"], name: "index_bean_categories_on_category_id", using: :btree
  end

  create_table "beans", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "status",                              default: 0
    t.string   "image_uid"
    t.decimal  "price",       precision: 5, scale: 2
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug",       null: false
    t.index ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
  end

  create_table "order_beans", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "bean_id"
    t.integer  "quantity"
    t.float    "price"
    t.float    "subtotal"
    t.string   "item_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bean_id"], name: "index_order_beans_on_bean_id", using: :btree
    t.index ["order_id"], name: "index_order_beans_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "total_price"
    t.string   "status",      default: "Ordered"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "role",                  default: 0
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_foreign_key "bean_categories", "beans"
  add_foreign_key "bean_categories", "categories"
  add_foreign_key "order_beans", "beans"
  add_foreign_key "order_beans", "orders"
  add_foreign_key "orders", "users"
end
