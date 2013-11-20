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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131115114446) do

  create_table "championships", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "championships_users", :force => true do |t|
    t.integer "championship_id"
    t.integer "user_id"
  end

  create_table "gambles", :force => true do |t|
    t.integer  "team_home_score"
    t.integer  "team_away_score"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "match_id"
  end

  add_index "gambles", ["match_id"], :name => "index_gambles_on_match_id"
  add_index "gambles", ["user_id"], :name => "index_gambles_on_user_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "active",          :default => true
    t.integer  "championship_id"
  end

  add_index "groups", ["championship_id"], :name => "index_groups_on_championship_id"

  create_table "matches", :force => true do |t|
    t.integer  "team_home_id"
    t.integer  "team_alway_id"
    t.integer  "score_team_home"
    t.integer  "score_team_away"
    t.datetime "date_match"
    t.integer  "group_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "matches", ["team_alway_id"], :name => "index_matches_on_team_alway_id"
  add_index "matches", ["team_home_id"], :name => "index_matches_on_team_home_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "abbreviation"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
