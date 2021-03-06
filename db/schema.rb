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

ActiveRecord::Schema.define(version: 20180326104753) do

  create_table "admins", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "password_digest"
    t.string "title"
  end

  create_table "assignments", force: :cascade do |t|
    t.string "instructions"
    t.string "name"
    t.string "due_date"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.string "location"
    t.integer "user_id"
    t.string "user_name"
    t.boolean "edited", default: false
    t.boolean "teacher_comment", default: false
    t.integer "klass_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.string "time_day"
    t.integer "weeks"
    t.string "location"
    t.string "description"
    t.integer "user_id"
  end

  create_table "user_assignments", force: :cascade do |t|
    t.integer "assignment_id"
    t.integer "user_id"
  end

  create_table "user_klasses", force: :cascade do |t|
    t.integer "klass_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.string "password_digest"
  end

end
