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

ActiveRecord::Schema.define(:version => 20120211094741) do

  create_table "attachments", :force => true do |t|
    t.integer  "type"
    t.string   "URL"
    t.string   "description"
    t.integer  "post_id"
    t.string   "Credits"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.integer  "post_date"
    t.boolean  "published"
    t.string   "title"
    t.text     "body"
    t.integer  "attachments_id"
    t.text     "tags"
    t.integer  "user_id"
    t.text     "slug"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.boolean  "active_author"
    t.integer  "school_id"
    t.text     "bio"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
