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

ActiveRecord::Schema.define(version: 20140323043702) do

  create_table "lines", force: true do |t|
    t.integer  "player_id"
    t.datetime "event_date"
    t.integer  "minutes"
    t.integer  "points"
    t.integer  "field_goals_made"
    t.integer  "field_goals_attempted"
    t.integer  "free_throws_made"
    t.integer  "free_throws_attempted"
    t.integer  "three_pointers_made"
    t.integer  "rebounds"
    t.integer  "assists"
    t.integer  "blocks"
    t.integer  "steals"
    t.integer  "turnovers"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier"
    t.string   "opponent"
  end

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "salary"
    t.integer  "points"
    t.integer  "field_goals_made"
    t.integer  "field_goals_attempted"
    t.integer  "free_throws_made"
    t.integer  "free_throws_attempted"
    t.integer  "three_pointers_made"
    t.integer  "rebounds"
    t.integer  "assists"
    t.integer  "blocks"
    t.integer  "steals"
    t.integer  "turnovers"
    t.integer  "team_id"
    t.string   "nba_team"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_name"
    t.string   "position"
  end

  create_table "superusers", force: true do |t|
    t.string   "name"
    t.string   "key"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
