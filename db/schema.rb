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

ActiveRecord::Schema.define(version: 20130620073959) do

  create_table "chairs", force: true do |t|
    t.string  "name"
    t.integer "faculty_id"
  end

  add_index "chairs", ["faculty_id"], name: "index_chairs_on_faculty_id", using: :btree

  create_table "chairs_users", id: false, force: true do |t|
    t.integer "chair_id", null: false
    t.integer "user_id",  null: false
  end

  create_table "comments", force: true do |t|
    t.string  "text"
    t.integer "user_id"
    t.integer "micropost_id"
  end

  add_index "comments", ["micropost_id"], name: "index_comments_on_micropost_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "faculties", force: true do |t|
    t.string  "name"
    t.integer "university_id"
  end

  add_index "faculties", ["university_id"], name: "index_faculties_on_university_id", using: :btree

  create_table "groups", force: true do |t|
    t.string  "name"
    t.integer "chair_id"
  end

  add_index "groups", ["chair_id"], name: "index_groups_on_chair_id", using: :btree

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id", using: :btree

  create_table "ratings", force: true do |t|
    t.integer "value"
    t.integer "user_id"
    t.integer "micropost_id"
  end

  add_index "ratings", ["micropost_id"], name: "index_ratings_on_micropost_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "universities", force: true do |t|
    t.string "name"
    t.string "address"
  end

  create_table "user_session_timetables", force: true do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "user_id"
  end

  add_index "user_session_timetables", ["user_id"], name: "index_user_session_timetables_on_user_id", using: :btree

  create_table "user_types", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.integer  "group_id"
    t.integer  "user_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree
  add_index "users", ["user_type_id"], name: "index_users_on_user_type_id", using: :btree

end
