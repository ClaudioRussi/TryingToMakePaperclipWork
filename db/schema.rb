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

ActiveRecord::Schema.define(version: 20160718160628) do

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "memes_id"
    t.integer  "meme_id"
  end

  add_index "comments", ["meme_id"], name: "index_comments_on_meme_id"
  add_index "comments", ["memes_id"], name: "index_comments_on_memes_id"
  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "memes", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "vote_count",        default: 0
    t.integer  "vote",              default: 0
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "body_file_name"
    t.string   "body_content_type"
    t.integer  "body_file_size"
    t.datetime "body_updated_at"
    t.string   "status",            default: "In Moderation"
  end

  add_index "memes", ["user_id"], name: "index_memes_on_user_id"

  create_table "memes_users", id: false, force: :cascade do |t|
    t.integer "meme_id", null: false
    t.integer "user_id", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipent_id"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "messages", ["recipent_id"], name: "index_messages_on_recipent_id"
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id"

  create_table "posts", force: :cascade do |t|
    t.string   "category"
    t.string   "title"
    t.integer  "user_id"
    t.text     "body"
    t.integer  "votes"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "admin"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
