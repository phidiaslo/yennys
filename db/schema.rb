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

ActiveRecord::Schema.define(version: 20150226034040) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "name",            limit: 140
    t.text     "description"
    t.decimal  "price",                       precision: 10, scale: 2
    t.string   "processing_time"
    t.integer  "view_count",                                           default: 0,                  null: false
    t.string   "status",                                               default: "Pending Approval"
    t.string   "slug"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.integer  "location_id"
    t.datetime "created_at",                                                                        null: false
    t.datetime "updated_at",                                                                        null: false
  end

  add_index "listings", ["category_id"], name: "index_listings_on_category_id"
  add_index "listings", ["location_id"], name: "index_listings_on_location_id"
  add_index "listings", ["slug"], name: "index_listings_on_slug", unique: true
  add_index "listings", ["subcategory_id"], name: "index_listings_on_subcategory_id"
  add_index "listings", ["user_id"], name: "index_listings_on_user_id"

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "birthday"
    t.text     "about"
    t.string   "username"
    t.string   "role",                   default: "Member"
    t.string   "country"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
