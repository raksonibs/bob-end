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

ActiveRecord::Schema.define(version: 20160618191931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.text     "description"
    t.text     "state",       default: "borrowed"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "section"
    t.text     "sub_section"
    t.text     "title"
    t.text     "abstract"
    t.text     "url"
  end

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price",          precision: 5, scale: 2
    t.integer  "author_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "publisher_type"
    t.integer  "publisher_id"
    t.index ["author_id"], name: "index_books_on_author_id", using: :btree
    t.index ["publisher_type", "publisher_id"], name: "index_books_on_publisher_type_and_publisher_id", using: :btree
  end

  create_table "publishing_houses", force: :cascade do |t|
    t.string   "name"
    t.decimal  "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string   "text"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "books", "authors"
end
