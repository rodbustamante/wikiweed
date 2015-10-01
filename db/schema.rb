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

ActiveRecord::Schema.define(version: 20151001152419) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "families", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flavors", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "growshops", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "address"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "has_categories", force: true do |t|
    t.integer  "plant_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "has_categories", ["category_id"], name: "index_has_categories_on_category_id", using: :btree
  add_index "has_categories", ["plant_id"], name: "index_has_categories_on_plant_id", using: :btree

  create_table "has_flavors", force: true do |t|
    t.integer  "flavor_id"
    t.integer  "plant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "has_flavors", ["flavor_id"], name: "index_has_flavors_on_flavor_id", using: :btree
  add_index "has_flavors", ["plant_id"], name: "index_has_flavors_on_plant_id", using: :btree

  create_table "has_plants", force: true do |t|
    t.integer  "plant_id"
    t.integer  "growshop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "has_plants", ["growshop_id"], name: "index_has_plants_on_growshop_id", using: :btree
  add_index "has_plants", ["plant_id"], name: "index_has_plants_on_plant_id", using: :btree

  create_table "image_plants", force: true do |t|
    t.string   "image"
    t.integer  "plant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "image_plants", ["plant_id"], name: "index_image_plants_on_plant_id", using: :btree

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
    t.integer  "seed_bank_id"
    t.string   "slug"
    t.integer  "strain_id_id"
    t.integer  "strain_id"
  end

  add_index "plants", ["strain_id"], name: "index_plants_on_strain_id", using: :btree
  add_index "plants", ["strain_id_id"], name: "index_plants_on_strain_id_id", using: :btree

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "score"
    t.integer  "plant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["plant_id"], name: "index_reviews_on_plant_id", using: :btree

  create_table "seed_banks", force: true do |t|
    t.string   "name"
    t.text     "summary"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "strains", force: true do |t|
    t.string   "name"
    t.integer  "sort_order"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
