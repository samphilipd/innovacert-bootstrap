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

ActiveRecord::Schema.define(version: 20140417155719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluation_events", force: true do |t|
    t.integer  "instrument_id"
    t.integer  "worker_id"
    t.datetime "evaluation_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "evaluation_events", ["instrument_id"], name: "index_evaluation_events_on_instrument_id", using: :btree
  add_index "evaluation_events", ["worker_id"], name: "index_evaluation_events_on_worker_id", using: :btree

  create_table "instruments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ucl_id"
  end

  create_table "interview_questions", force: true do |t|
    t.integer  "interview_section_id"
    t.integer  "question_number"
    t.text     "question_content"
    t.text     "sample_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interview_questions", ["interview_section_id"], name: "index_interview_questions_on_interview_section_id", using: :btree

  create_table "interview_sections", force: true do |t|
    t.integer  "instrument_id"
    t.integer  "section_number"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interview_sections", ["instrument_id"], name: "index_interview_sections_on_instrument_id", using: :btree

  create_table "observation_questions", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "observation_section_id"
    t.integer  "question_number"
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
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rut"
  end

end
