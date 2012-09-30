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

ActiveRecord::Schema.define(:version => 20120930192837) do

  create_table "applicants", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "classroom"
    t.integer  "region_id"
    t.text     "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "attachments", :force => true do |t|
    t.integer  "classroom_id"
    t.integer  "theme_id"
    t.integer  "user_id"
    t.string   "youtube_url"
    t.string   "contributors"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "image"
    t.integer  "region_id"
    t.string   "format"
  end

  create_table "classrooms", :force => true do |t|
    t.integer  "region_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "stat"
    t.text     "description"
    t.string   "image"
    t.string   "map"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "image"
    t.text     "description"
  end

  create_table "theme_suggestions", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "themes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "prompt"
    t.boolean  "current_theme"
  end

  create_table "users", :force => true do |t|
    t.integer  "classroom_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "image"
    t.string   "password_digest"
    t.string   "type"
  end

end
