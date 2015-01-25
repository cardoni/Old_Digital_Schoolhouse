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

ActiveRecord::Schema.define(:version => 20120214223858) do

  create_table "articles", :force => true do |t|
    t.datetime "article_date"
    t.boolean  "published"
    t.string   "article_title"
    t.text     "article_body"
    t.text     "article_tags"
    t.integer  "user_id"
    t.string   "attachment_URL"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "yt_url"
    t.string   "image_url"
  end

  create_table "attachments", :force => true do |t|
    t.string   "media_type"
    t.integer  "article_id"
    t.integer  "media_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "copyright"
    t.string   "location"
    t.string   "provider"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "copyright"
    t.string   "location"
    t.string   "provider"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
