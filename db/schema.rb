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

ActiveRecord::Schema.define(version: 20131219023739) do

  create_table "favorites", force: true do |t|
    t.string   "friendly"
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.boolean  "has_food"
    t.boolean  "has_coffee"
    t.boolean  "has_drinks"
    t.string   "website"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "photo"
    t.string   "alt"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "friendly"
    t.boolean  "in_timeline", default: true
  end

  create_table "users", force: true do |t|
    t.string   "hash_provider"
    t.string   "hash_uid"
    t.text     "name",          default: "Stranger"
    t.boolean  "is_admin",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
