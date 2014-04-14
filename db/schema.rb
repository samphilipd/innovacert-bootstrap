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

ActiveRecord::Schema.define(version: 20140414131614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instruments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ucl_id"
    t.text     "questionnaire"
    t.text     "observation"
  end

  create_table "observation_questions", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "observation_section_id"
  end

  add_index "observation_questions", ["observation_section_id"], name: "index_observation_questions_on_observation_section_id", using: :btree

  create_table "observation_sections", force: true do |t|
    t.integer  "instrument_id"
    t.integer  "section_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "observation_sections", ["instrument_id"], name: "index_observation_sections_on_instrument_id", using: :btree

  create_table "ucls", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ucls_workers", id: false, force: true do |t|
    t.integer "ucl_id",    null: false
    t.integer "worker_id", null: false
  end

  add_index "ucls_workers", ["ucl_id"], name: "index_ucls_workers_on_ucl_id", using: :btree
  add_index "ucls_workers", ["worker_id"], name: "index_ucls_workers_on_worker_id", using: :btree

  create_table "workers", force: true do |t|
    t.string   "name"
    t.integer  "rut"
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
