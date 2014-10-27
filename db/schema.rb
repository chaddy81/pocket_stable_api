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

ActiveRecord::Schema.define(version: 20141025213937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
    t.integer  "user_id"
    t.string   "name"
    t.string   "tags"
    t.text     "filename"
  end

  create_table "horses", force: true do |t|
    t.string   "name"
    t.string   "nick_name"
    t.string   "sex"
    t.string   "fertility"
    t.datetime "foaling_date"
    t.string   "color"
    t.datetime "date_of_birth"
    t.string   "markings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "avatar"
    t.string   "breed"
    t.string   "registration_number"
    t.string   "org_numbers"
    t.text     "emergencies"
    t.text     "comments"
  end

  add_index "horses", ["user_id"], name: "index_horses_on_user_id", using: :btree

  create_table "notes", force: true do |t|
    t.string   "title"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "photos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filename"
    t.integer  "horse_id"
  end

  add_index "photos", ["horse_id"], name: "index_photos_on_horse_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "veterinarians", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "weights", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight"
    t.integer  "horse_id"
    t.integer  "user_id"
  end

end
