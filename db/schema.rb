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

ActiveRecord::Schema.define(version: 20141019045252) do

  create_table "articles", force: true do |t|
    t.string   "domain"
    t.integer  "next_page_id"
    t.string   "url"
    t.string   "short_url"
    t.string   "author"
    t.string   "excerpt"
    t.string   "direction"
    t.integer  "word_count"
    t.integer  "total_pages"
    t.text     "content"
    t.string   "date_published"
    t.string   "dek"
    t.string   "lead_image_url"
    t.string   "title"
    t.integer  "rendered_pages"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
