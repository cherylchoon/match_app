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

ActiveRecord::Schema.define(version: 20170328183505) do

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "conversations", ["sender_id", "receiver_id"], name: "index_conversations_on_sender_id_and_receiver_id", unique: true

  create_table "ethnicities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ethnicities_preferences", id: false, force: :cascade do |t|
    t.integer "ethnicity_id",  null: false
    t.integer "preference_id", null: false
  end

  create_table "ethnicities_profiles", id: false, force: :cascade do |t|
    t.integer "ethnicity_id", null: false
    t.integer "profile_id",   null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests_preferences", id: false, force: :cascade do |t|
    t.integer "interest_id",   null: false
    t.integer "preference_id", null: false
  end

  create_table "interests_profiles", id: false, force: :cascade do |t|
    t.integer "interest_id", null: false
    t.integer "profile_id",  null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "liker_id"
    t.integer  "liked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["liked_id"], name: "index_likes_on_liked_id"
  add_index "likes", ["liker_id"], name: "index_likes_on_liker_id"

  create_table "personal_messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "personal_messages", ["conversation_id"], name: "index_personal_messages_on_conversation_id"
  add_index "personal_messages", ["user_id"], name: "index_personal_messages_on_user_id"

  create_table "pictures", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "caption"
  end

  add_index "pictures", ["user_id"], name: "index_pictures_on_user_id"

  create_table "preferences", force: :cascade do |t|
    t.integer  "min_height_feet"
    t.integer  "min_height_inches"
    t.integer  "max_height_feet"
    t.integer  "max_height_inches"
    t.string   "body_type"
    t.string   "status"
    t.string   "has_kids"
    t.string   "wants_kids"
    t.string   "education"
    t.string   "smoking"
    t.string   "drinking"
    t.string   "salary"
    t.text     "specifications"
    t.text     "essay"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id"

  create_table "preferences_religions", id: false, force: :cascade do |t|
    t.integer "religion_id",   null: false
    t.integer "preference_id", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "height_feet"
    t.integer  "height_inches"
    t.string   "body_type"
    t.string   "status"
    t.string   "has_kids"
    t.string   "wants_kids"
    t.string   "education"
    t.string   "smoking"
    t.string   "drinking"
    t.string   "religion"
    t.string   "salary"
    t.text     "interests"
    t.text     "specifications"
    t.text     "essay"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "profiles_religions", id: false, force: :cascade do |t|
    t.integer "religion_id", null: false
    t.integer "profile_id",  null: false
  end

  create_table "religions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "zip_code"
    t.string   "gender"
    t.date     "birthday"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "loggedin"
    t.boolean  "is_active",       default: true
  end

end
