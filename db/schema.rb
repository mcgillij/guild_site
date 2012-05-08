# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080909021034) do

  create_table "comments", :force => true do |t|
    t.integer  "post_id",    :limit => 11
    t.text     "body"
    t.integer  "user_id",    :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "start_date"
    t.string   "length"
    t.integer  "user_id",    :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forum_posts", :force => true do |t|
    t.text     "body"
    t.integer  "user_id",         :limit => 11
    t.integer  "forum_topics_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forum_topics", :force => true do |t|
    t.string   "title"
    t.integer  "user_id",    :limit => 11
    t.boolean  "sticky"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poll_answers", :force => true do |t|
    t.string  "description"
    t.integer "poll_question_id", :limit => 11
    t.integer "votes",            :limit => 11, :default => 0
  end

  create_table "poll_player_answers", :force => true do |t|
    t.integer "user_id",          :limit => 11
    t.integer "poll_question_id", :limit => 11
  end

  create_table "poll_questions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id",     :limit => 11
    t.boolean  "active",                    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "public_flag"
    t.integer  "user_id",     :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "rname"
  end

  create_table "roles_users", :force => true do |t|
    t.integer "user_id", :limit => 11
    t.integer "role_id", :limit => 11
  end

  create_table "trophies", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id",    :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "player_class"
    t.string   "avatar"
  end

end
