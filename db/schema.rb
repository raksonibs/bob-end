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

ActiveRecord::Schema.define(version: 20160626160029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.integer  "location_id"
    t.text     "story"
    t.string   "title"
    t.datetime "publishedAt"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image_url"
    t.index ["location_id"], name: "index_articles_on_location_id", using: :btree
  end

  create_table "favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_favourites_on_article_id", using: :btree
    t.index ["user_id"], name: "index_favourites_on_user_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "type"
    t.integer  "num_players"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "country"
    t.string   "continent"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_matches_on_game_id", using: :btree
  end

  create_table "money", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_money_on_user_id", using: :btree
  end

  create_table "played_games", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.string   "outcome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_played_games_on_game_id", using: :btree
    t.index ["user_id"], name: "index_played_games_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "password_digest"
  end

  add_foreign_key "articles", "locations"
  add_foreign_key "favourites", "articles"
  add_foreign_key "favourites", "users"
  add_foreign_key "money", "users"
end
