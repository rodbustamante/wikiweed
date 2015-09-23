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

ActiveRecord::Schema.define(version: 20150817205319) do

  create_table "categories", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "families", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plant_categories", force: true do |t|
    t.integer  "plant_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plant_categories", ["category_id"], name: "index_plant_categories_on_category_id", using: :btree
  add_index "plant_categories", ["plant_id"], name: "index_plant_categories_on_plant_id", using: :btree

  create_table "plants", force: true do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "characteristics"
    t.integer  "percent_sativa"
    t.integer  "percent_indica"
    t.integer  "thc"
    t.integer  "visits"
    t.string   "image"
    t.string   "video"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "family_id"
  end

  add_index "plants", ["family_id"], name: "index_plants_on_family_id", using: :btree
  add_index "plants", ["name"], name: "index_plants_on_name", using: :btree

end
