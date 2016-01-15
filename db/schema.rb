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

ActiveRecord::Schema.define(version: 20160111090649) do

  create_table "administrators", force: true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.string   "salt"
    t.boolean  "is_admin",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contests", force: true do |t|
    t.integer  "exam_id"
    t.integer  "user_id"
    t.integer  "mark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contests", ["exam_id"], name: "index_contests_on_exam_id", using: :btree
  add_index "contests", ["user_id"], name: "index_contests_on_user_id", using: :btree

  create_table "exams", force: true do |t|
    t.string   "name",                                       null: false
    t.text     "description"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.integer  "timespan"
    t.integer  "administrator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "average_difficulty", precision: 5, scale: 2
  end

  create_table "exams_questions", id: false, force: true do |t|
    t.integer "exam_id",     null: false
    t.integer "question_id", null: false
  end

  add_index "exams_questions", ["exam_id", "question_id"], name: "index_exams_questions_on_exam_id_and_question_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "title",                            null: false
    t.text     "description"
    t.text     "options",                          null: false
    t.integer  "administrator_id"
    t.string   "answer",                           null: false
    t.boolean  "multiple",         default: false
    t.integer  "difficulty",       default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["administrator_id", "difficulty"], name: "index_questions_on_administrator_id_and_difficulty", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "name",            null: false
    t.string   "hashed_password"
    t.integer  "age"
    t.boolean  "sex"
    t.string   "school"
    t.string   "college"
    t.string   "profession"
    t.string   "work",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
