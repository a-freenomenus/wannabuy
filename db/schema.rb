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

ActiveRecord::Schema.define(:version => 20110501132657) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["request_id"], :name => "index_comments_on_request_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "criterions", :force => true do |t|
    t.string   "name"
    t.integer  "request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "value"
    t.integer  "response_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["response_id"], :name => "index_ratings_on_response_id"
  add_index "ratings", ["user_id"], :name => "index_ratings_on_user_id"

  create_table "requests", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",                    :default => "not-started", :null => false
    t.integer  "category_id"
    t.string   "city",        :limit => 15
  end

  add_index "requests", ["category_id"], :name => "index_requests_on_category_id"
  add_index "requests", ["user_id"], :name => "index_requests_on_user_id"

  create_table "responses", :force => true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.integer  "request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "price",       :limit => 5
    t.boolean  "torg",                     :default => false
  end

  add_index "responses", ["request_id"], :name => "index_responses_on_request_id"
  add_index "responses", ["user_id"], :name => "index_responses_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "values", :force => true do |t|
    t.string   "name"
    t.integer  "criterion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
