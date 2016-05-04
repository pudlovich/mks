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

ActiveRecord::Schema.define(version: 20160504130435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parcels", force: :cascade do |t|
    t.string   "name"
    t.integer  "width",                                 null: false
    t.integer  "height",                                null: false
    t.integer  "depth",                                 null: false
    t.decimal  "weight",        precision: 6, scale: 2, null: false
    t.decimal  "price",         precision: 6, scale: 2, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "sender_id"
    t.integer  "parcel_number",                         null: false
  end

  add_index "parcels", ["parcel_number"], name: "index_parcels_on_parcel_number", unique: true, using: :btree

  create_table "recipient_infos", force: :cascade do |t|
    t.string  "email",        null: false
    t.string  "contact_name", null: false
    t.string  "company_name"
    t.string  "zip_code",     null: false
    t.string  "address",      null: false
    t.string  "city",         null: false
    t.string  "phone_number", null: false
    t.boolean "residential",  null: false
    t.string  "other_info"
  end

  create_table "sender_infos", force: :cascade do |t|
    t.string  "email",        null: false
    t.string  "contact_name", null: false
    t.string  "company_name"
    t.string  "zip_code",     null: false
    t.string  "address",      null: false
    t.string  "city",         null: false
    t.string  "phone_number", null: false
    t.boolean "residential",  null: false
    t.string  "other_info"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "parcels", "users", column: "sender_id"
end
