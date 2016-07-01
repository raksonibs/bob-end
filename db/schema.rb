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

ActiveRecord::Schema.define(version: 20160701182006) do

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

  create_table "connect_fours", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "game_type_id"
    t.integer  "num_players"
    t.string   "name"
  end

  create_table "favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_favourites_on_article_id", using: :btree
    t.index ["user_id"], name: "index_favourites_on_user_id", using: :btree
  end

  create_table "game_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "num_players"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "num_players"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "game_type_id"
    t.integer  "user_id"
    t.integer  "match_id"
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
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "game_type_id"
    t.string   "unique_id"
    t.decimal  "match_amount"
  end

  create_table "outcomes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "match_id"
    t.decimal  "amount_won"
    t.decimal  "amount_taken"
    t.decimal  "percentage_taken"
    t.integer  "outcome_value"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["match_id"], name: "index_outcomes_on_match_id", using: :btree
    t.index ["user_id"], name: "index_outcomes_on_user_id", using: :btree
  end

  create_table "played_games", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "outcome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "total_bet"
    t.integer  "match_id"
    t.index ["game_id"], name: "index_played_games_on_game_id", using: :btree
    t.index ["match_id"], name: "index_played_games_on_match_id", using: :btree
    t.index ["user_id"], name: "index_played_games_on_user_id", using: :btree
  end

  create_table "rock_paper_scissors", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "game_type_id"
    t.integer  "num_players"
    t.string   "name"
  end

  create_table "rubies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rubies_on_user_id", using: :btree
  end

  create_table "stixes", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "game_type_id"
    t.integer  "num_players"
    t.string   "name"
  end

  create_table "tic_tac_toes", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "game_type_id"
    t.integer  "num_players"
    t.string   "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "password_digest"
    t.decimal  "ruby_amount",           default: "0.0"
  end

  create_table "wagers", force: :cascade do |t|
    t.string   "wagable_type"
    t.integer  "wagable_id"
    t.decimal  "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "match_id"
    t.integer  "game_id"
    t.index ["match_id"], name: "index_wagers_on_match_id", using: :btree
    t.index ["user_id"], name: "index_wagers_on_user_id", using: :btree
  end

  add_foreign_key "articles", "locations"
  add_foreign_key "favourites", "articles"
  add_foreign_key "favourites", "users"
  add_foreign_key "outcomes", "matches"
  add_foreign_key "outcomes", "users"
  add_foreign_key "played_games", "matches"
  add_foreign_key "rubies", "users"
  add_foreign_key "wagers", "matches"
  add_foreign_key "wagers", "users"
end
