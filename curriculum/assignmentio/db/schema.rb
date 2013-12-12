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

ActiveRecord::Schema.define(:version => 20121212174048) do

  create_table "assignments", :force => true do |t|
    t.string   "name"
    t.date     "due_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "content"
    t.string   "student_assigned"
    t.integer  "author_id"
    t.integer  "submission_id"
    t.string   "assignment_file"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "created_by_id"
  end

  create_table "organizations", :force => true do |t|
    t.text     "name"
    t.text     "subdomain"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "org_code"
  end

  create_table "submissions", :force => true do |t|
    t.text     "content"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "user_assignment_id"
    t.text     "feedback"
    t.string   "submitted_file"
  end

  create_table "user_assignments", :force => true do |t|
    t.integer  "assignment_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "status"
  end

  create_table "user_groups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "email"
    t.string   "password_digest"
    t.string   "role_names"
    t.boolean  "registered"
    t.string   "authentication_token"
    t.integer  "organization_id"
  end

end
