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

ActiveRecord::Schema.define(version: 0) do

  create_table "ng_albums", primary_key: "ng_albums_id", force: :cascade do |t|
    t.integer "ng_singers_id",  limit: 4
    t.string  "album_name",     limit: 100
    t.string  "release_year",   limit: 4
    t.string  "record_company", limit: 200
  end

  add_index "ng_albums", ["album_name", "release_year", "record_company"], name: "album_name", unique: true, using: :btree
  add_index "ng_albums", ["ng_singers_id"], name: "ng_singers_id", using: :btree

  create_table "ng_singers", primary_key: "ng_singers_id", force: :cascade do |t|
    t.string "name", limit: 100
    t.date   "dob"
    t.string "sex",  limit: 10
  end

  add_index "ng_singers", ["name"], name: "name", unique: true, using: :btree

  create_table "ng_users", primary_key: "ng_users_id", force: :cascade do |t|
    t.string "username", limit: 100
    t.string "password", limit: 100
  end

  add_index "ng_users", ["username"], name: "username", unique: true, using: :btree

  add_foreign_key "ng_albums", "ng_singers", column: "ng_singers_id", primary_key: "ng_singers_id", name: "ng_albums_ibfk_1"
end
