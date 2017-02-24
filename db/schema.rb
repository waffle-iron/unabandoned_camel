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

ActiveRecord::Schema.define(version: 20170223224351) do

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
    t.integer  "price"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "region_id"
    t.index ["region_id"], name: "index_beans_on_region_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug",       null: false
    t.index ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string "title"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_foreign_key "bean_categories", "beans"
  add_foreign_key "bean_categories", "categories"
  add_foreign_key "beans", "regions"
end
