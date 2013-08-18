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

ActiveRecord::Schema.define(version: 20130817133200) do

  create_table "games", force: true do |t|
    t.string   "vs_team"
    t.datetime "date"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["team_id"], name: "index_games_on_team_id"

  create_table "goals", force: true do |t|
    t.integer  "time"
    t.integer  "game_id"
    t.integer  "player_id"
    t.boolean  "is_our_goal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["game_id"], name: "index_goals_on_game_id"
  add_index "goals", ["player_id"], name: "index_goals_on_player_id"

  create_table "players", force: true do |t|
    t.string   "name",                         null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.integer  "team_id",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "players", ["remember_me_token"], name: "index_players_on_remember_me_token"

  create_table "teams", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
