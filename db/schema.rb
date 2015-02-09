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

ActiveRecord::Schema.define(version: 20150206042249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file",       limit: 255
    t.integer  "user_id"
    t.string   "name",       limit: 255
    t.string   "horses",     limit: 255
    t.text     "filename"
  end

  create_table "health_informations", force: :cascade do |t|
    t.date     "last_dentist"
    t.string   "dentist_name",       limit: 255
    t.string   "dentist_phone",      limit: 255
    t.integer  "dentist_interval"
    t.date     "last_coggins"
    t.date     "last_deworming"
    t.date     "last_tetanus"
    t.date     "last_rabies"
    t.date     "last_vew"
    t.date     "last_botulism"
    t.date     "last_potomac"
    t.date     "last_strangles"
    t.date     "last_anthrax"
    t.date     "last_rhino_flu"
    t.integer  "rhino_interval"
    t.date     "last_west_nile"
    t.integer  "west_nile_interval"
    t.text     "other_vacc"
    t.text     "health_comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "horse_id"
  end

  create_table "horse_document", force: :cascade do |t|
    t.integer  "horse_id"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "horses", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "nick_name",           limit: 255
    t.string   "sex",                 limit: 255
    t.string   "fertility",           limit: 255
    t.datetime "foaling_date"
    t.string   "color",               limit: 255
    t.datetime "date_of_birth"
    t.string   "markings",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "avatar",              limit: 255
    t.string   "breed",               limit: 255
    t.string   "registration_number", limit: 255
    t.string   "org_numbers",         limit: 255
    t.text     "emergencies"
    t.text     "comments"
  end

  add_index "horses", ["user_id"], name: "index_horses_on_user_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "card_last4"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.date     "next_charge_date"
    t.decimal  "cost",             precision: 8, scale: 2
    t.string   "charge_interval",                          default: "yearly"
    t.integer  "total_horses",                             default: 1
    t.string   "stripe_token"
    t.decimal  "temp_cost",        precision: 8, scale: 2
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filename",   limit: 255
    t.integer  "horse_id"
    t.string   "image",      limit: 255
  end

  add_index "photos", ["horse_id"], name: "index_photos_on_horse_id", using: :btree

  create_table "stable_informations", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_farrier"
    t.string   "farrier_name",     limit: 255
    t.string   "farrier_phone",    limit: 255
    t.integer  "farrier_interval"
    t.string   "hay",              limit: 255
    t.string   "feed",             limit: 255
    t.text     "supplements"
    t.integer  "horse_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "email",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "authentication_token",   limit: 255
    t.string   "name",                   limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "cus_token"
    t.string   "string"
    t.string   "cus_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "veterinarians", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "weights", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight"
    t.integer  "horse_id"
    t.integer  "user_id"
  end

end
