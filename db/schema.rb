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

ActiveRecord::Schema.define(version: 20130422041216) do

  create_table "admins", force: true do |t|
    t.string   "adminname"
    t.string   "password"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "case_tags", force: true do |t|
    t.string "name"
  end

  create_table "case_tags_cases", force: true do |t|
    t.integer "case_tag_id"
    t.integer "case_id"
  end

  create_table "cases", force: true do |t|
    t.string   "title"
    t.string   "pic"
    t.text     "content"
    t.integer  "is_hot",     default: 0
    t.datetime "created_at"
  end

  create_table "kindeditor_assets", force: true do |t|
    t.string   "asset"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magazines", force: true do |t|
    t.string   "title"
    t.string   "cover"
    t.string   "folder"
    t.string   "zip"
    t.datetime "created_at"
  end

  create_table "night_items", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "cover"
    t.string   "play_addr"
    t.datetime "created_at"
  end

  create_table "night_presenters", force: true do |t|
    t.string   "name"
    t.string   "cover"
    t.string   "weibo"
    t.text     "info"
    t.datetime "created_at"
  end

  create_table "run_logs", force: true do |t|
    t.string   "log_path"
    t.string   "log_method"
    t.string   "log_params"
    t.string   "log_exception"
    t.string   "log_remote_ip"
    t.datetime "created_at"
  end

  create_table "sys_settings", force: true do |t|
    t.string "stype"
    t.text   "setting"
  end

  create_table "topics", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
  end

end
