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

ActiveRecord::Schema.define(version: 20140202153640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: true do |t|
    t.string "name"
  end

  create_table "clubs", force: true do |t|
    t.integer "city_id"
    t.string  "name"
  end

  create_table "game_classes", force: true do |t|
    t.boolean  "active"
    t.integer  "season_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", force: true do |t|
    t.string   "name"
    t.integer  "weekday"
    t.string   "sport"
    t.integer  "club_id"
    t.integer  "rules_id"
    t.integer  "keeper_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "prize"
    t.string   "description"
    t.integer  "max_number_of_players",                        default: 50
    t.boolean  "for_match_score_use_big_points"
    t.boolean  "for_match_score_use_small_points"
    t.integer  "for_match_score_required_big_points_spread"
    t.integer  "for_match_score_required_small_points_spread"
    t.integer  "for_match_score_big_points_upper_limit"
    t.integer  "for_match_score_small_points_upper_limit"
  end

  create_table "meetings", force: true do |t|
    t.datetime "date"
    t.integer  "game_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", force: true do |t|
    t.string   "name"
    t.integer  "year"
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",                   default: "Player"
    t.integer  "club_id"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "phone_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
