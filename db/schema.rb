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

ActiveRecord::Schema.define(version: 20150227124559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cds", force: true do |t|
    t.string   "artist"
    t.string   "name"
    t.string   "editor"
    t.string   "cover"
    t.integer  "year"
    t.string   "gender"
    t.date     "purchaseDate"
    t.integer  "item_collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cds", ["item_collection_id"], name: "index_cds_on_item_collection_id", using: :btree

  create_table "item_collections", force: true do |t|
    t.string   "name"
    t.date     "beginDate"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_collections", ["user_id"], name: "index_item_collections_on_user_id", using: :btree

  create_table "tracks", force: true do |t|
    t.string   "title"
    t.integer  "trackNumber"
    t.integer  "cd_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks", ["cd_id"], name: "index_tracks_on_cd_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "firstname"
    t.string   "pseudo"
    t.boolean  "anonym"
    t.date     "birthdate"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
