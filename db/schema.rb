# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 8) do

  create_table "attachments", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "attach_id"
    t.string   "attach_filename"
    t.integer  "attach_size"
    t.string   "attach_content_type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "attachments", ["product_id"], name: "index_attachments_on_product_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "displayed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "sku"
    t.text     "description"
    t.text     "short_description"
    t.boolean  "active"
    t.decimal  "weight",            precision: 8, scale: 3, default: 0.0
    t.decimal  "price",             precision: 8, scale: 2, default: 0.0
    t.decimal  "cost_price",        precision: 8, scale: 2, default: 0.0
    t.boolean  "featured"
    t.boolean  "stock_control"
    t.integer  "category_id"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "properties", ["product_id"], name: "index_properties_on_product_id", unique: true

  create_table "uploads", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "avatar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "uploads", ["product_id"], name: "index_uploads_on_product_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                                null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
