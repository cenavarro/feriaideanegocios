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

ActiveRecord::Schema.define(version: 20150327154722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "phase"
    t.string   "type"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "assign_projects", force: true do |t|
    t.integer "judge_id"
    t.integer "project_id"
    t.integer "phase"
  end

  create_table "careers", force: true do |t|
    t.string "name"
  end

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "fair_periods", force: true do |t|
    t.date     "started_at"
    t.date     "ended_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", force: true do |t|
    t.string  "carnet"
    t.string  "name"
    t.string  "phone"
    t.string  "email"
    t.integer "career_id"
    t.string  "location"
  end

  add_index "participants", ["carnet"], name: "index_participants_on_carnet", unique: true, using: :btree

  create_table "participants_projects", force: true do |t|
    t.integer "project_id"
    t.integer "participant_id"
  end

  create_table "projects", force: true do |t|
    t.string  "code"
    t.string  "name"
    t.integer "stand"
    t.integer "phase"
    t.text    "motivation"
    t.text    "description"
    t.text    "advantage"
    t.integer "category_id"
    t.date    "created_at"
    t.date    "updated_at"
    t.string  "motivated"
  end

  create_table "ratings", force: true do |t|
    t.integer "judge_id"
    t.integer "project_id"
    t.integer "phase"
    t.float   "criteria_1"
    t.float   "criteria_2"
    t.float   "criteria_3"
    t.float   "criteria_4"
    t.float   "criteria_5"
    t.float   "criteria_6"
    t.float   "criteria_7"
    t.date    "created_at"
    t.date    "updated_at"
  end

end
