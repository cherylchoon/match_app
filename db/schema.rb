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

ActiveRecord::Schema.define(version: 20170330225421) do

  create_table "chat_messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "chat_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chat_messages", ["chat_id"], name: "index_chat_messages_on_chat_id"
  add_index "chat_messages", ["user_id"], name: "index_chat_messages_on_user_id"

  create_table "chats", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "chats", ["recipient_id"], name: "index_chats_on_recipient_id"
  add_index "chats", ["sender_id"], name: "index_chats_on_sender_id"

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

  create_table "matches", force: :cascade do |t|
    t.boolean  "is_match",     default: false
    t.integer  "match_one_id"
    t.integer  "match_two_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "score"
  end

  add_index "matches", ["match_one_id"], name: "index_matches_on_match_one_id"
  add_index "matches", ["match_two_id"], name: "index_matches_on_match_two_id"

  create_table "messages", force: :cascade do |t|
    t.integer  "receiver_id"
    t.integer  "sender_id"
    t.text     "content"
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id"
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id"

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
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "gender"
    t.integer  "min_age"
    t.integer  "max_age"
    t.decimal  "height_min"
    t.decimal  "height_max"
  end

  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id"

  create_table "preferences_religions", id: false, force: :cascade do |t|
    t.integer "religion_id",   null: false
    t.integer "preference_id", null: false
  end

  create_table "profiles", force: :cascade do |t|
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
    t.decimal  "height"
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

  create_table "scores", force: :cascade do |t|
    t.boolean  "height",              default: false
    t.boolean  "body_type",           default: false
    t.boolean  "relationship_status", default: false
    t.boolean  "has_kids",            default: false
    t.boolean  "wants_kids",          default: false
    t.boolean  "education",           default: false
    t.boolean  "is_smoker",           default: false
    t.boolean  "is_drinker",          default: false
    t.boolean  "salary",              default: false
    t.boolean  "ethnicity",           default: false
    t.boolean  "religion",            default: false
    t.boolean  "interests",           default: false
    t.integer  "match_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "scores", ["match_id"], name: "index_scores_on_match_id"

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
    t.float    "lat"
    t.float    "lng"
    t.boolean  "is_active",       default: true
  end

end
