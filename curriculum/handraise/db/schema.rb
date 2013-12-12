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

ActiveRecord::Schema.define(:version => 20121212202143) do

  create_table "answers", :force => true do |t|
    t.integer  "issue_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "votes_count"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"

  create_table "issues", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
    t.string   "aasm_state"
    t.integer  "answer_id"
    t.string   "username"
    t.integer  "votes_count"
    t.integer  "organization_id"
  end

  create_table "organizations", :force => true do |t|
    t.string   "subdomain"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "remember_token"
    t.boolean  "is_instructor"
    t.string   "email"
    t.string   "image_url"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "organization_id"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "votes", :force => true do |t|
    t.integer  "value"
    t.integer  "comment_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "answer_id"
    t.integer  "issue_id"
  end

end
