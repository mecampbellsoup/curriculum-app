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

ActiveRecord::Schema.define(:version => 20130803180512) do

  create_table "feature_technologies", :force => true do |t|
    t.integer  "feature_id"
    t.integer  "technology_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "features", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_project_id"
  end

  create_table "project_technologies", :force => true do |t|
    t.integer  "project_id"
    t.integer  "technology_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "source"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
  end

  create_table "repos", :force => true do |t|
    t.string   "name"
    t.integer  "github_id"
    t.datetime "published_at"
    t.string   "url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
    t.string   "html_url"
    t.integer  "project_id"
    t.integer  "github_owner_id"
  end

  create_table "snippets", :force => true do |t|
    t.string   "name"
    t.string   "language"
    t.text     "code"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "url"
    t.string   "description"
    t.integer  "feature_id"
    t.integer  "position"
  end

  create_table "technologies", :force => true do |t|
    t.string   "name"
    t.string   "icon_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "uploads", :force => true do |t|
    t.string   "name"
    t.string   "extension"
    t.integer  "uploadable_id"
    t.string   "uploadable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "image"
    t.integer  "image_id"
    t.text     "description"
    t.integer  "position"
  end

  add_index "uploads", ["uploadable_id", "uploadable_type"], :name => "index_uploads_on_uploadable_id_and_uploadable_type"

  create_table "user_projects", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "contributor_github_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "avatar_url"
    t.string   "provider"
    t.string   "github_id"
    t.string   "token"
    t.boolean  "registered"
  end

end
