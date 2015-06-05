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

ActiveRecord::Schema.define(version: 20150529100915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "selfie_pairs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "earth_selfie_id"
    t.integer  "space_selfie_id"
  end

  add_index "selfie_pairs", ["earth_selfie_id"], name: "index_selfie_pairs_on_earth_selfie_id", using: :btree
  add_index "selfie_pairs", ["space_selfie_id"], name: "index_selfie_pairs_on_space_selfie_id", using: :btree
  add_index "selfie_pairs", ["user_id"], name: "index_selfie_pairs_on_user_id", using: :btree

  create_table "selfies", force: true do |t|
    t.string   "name"
    t.boolean  "in_space",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
    t.integer  "user_id"
  end

  add_index "selfies", ["user_id"], name: "index_selfies_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "accepted_terms", default: false
    t.string   "phone"
  end

end
