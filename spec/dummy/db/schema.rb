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

ActiveRecord::Schema.define(version: 20150710220933) do

  create_table "fagus_categories", force: :cascade do |t|
    t.string   "description", limit: 255,             null: false
    t.integer  "is_active",   limit: 4,   default: 1, null: false
    t.string   "name",        limit: 255,             null: false
    t.string   "reference",   limit: 255,             null: false
    t.string   "uuid",        limit: 32,              null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "fagus_item_types", force: :cascade do |t|
    t.string   "description", limit: 255,             null: false
    t.integer  "is_active",   limit: 4,   default: 0, null: false
    t.string   "uuid",        limit: 32,              null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "fagus_items", force: :cascade do |t|
    t.integer  "category_id",  limit: 4,   null: false
    t.string   "description",  limit: 255, null: false
    t.integer  "item_type_id", limit: 4,   null: false
    t.string   "reference",    limit: 255, null: false
    t.string   "status",       limit: 16,  null: false
    t.string   "uuid",         limit: 32,  null: false
    t.datetime "deleted_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "fagus_items", ["category_id"], name: "fk_rails_aa4b2d4cb2", using: :btree
  add_index "fagus_items", ["item_type_id"], name: "fk_rails_c6b33df9a0", using: :btree

  create_table "fagus_unit_of_measures", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "symbol",     limit: 32,  null: false
    t.string   "unit_type",  limit: 16,  null: false
    t.string   "uuid",       limit: 32,  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "fagus_items", "fagus_categories", column: "category_id"
  add_foreign_key "fagus_items", "fagus_item_types", column: "item_type_id"
end
