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

ActiveRecord::Schema.define(:version => 20130701155310) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.text     "answer"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "chats", :force => true do |t|
    t.string   "public_channel"
    t.string   "teacher_channel"
    t.integer  "classroom_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "classroom_name"
    t.integer  "quiz_id"
  end

  create_table "classrooms", :force => true do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "classrooms_students", :force => true do |t|
    t.integer "student_id"
    t.integer "classroom_id"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "questions", :force => true do |t|
    t.integer  "quiz_id"
    t.text     "question"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "correct_answer_id"
    t.integer  "position"
  end

  create_table "quizzes", :force => true do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "submissions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "student_id"
    t.integer  "answer_id"
  end

  add_index "submissions", ["answer_id"], :name => "index_submissions_on_answer_id"
  add_index "submissions", ["student_id"], :name => "index_submissions_on_student_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "token"
  end

end
