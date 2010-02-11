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

ActiveRecord::Schema.define(:version => 20100211182558) do

  create_table "billing_informations", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "name",       :null => false
    t.text     "address",    :null => false
    t.string   "taxid",      :null => false
    t.text     "other"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "billing_informations", ["user_id"], :name => "index_billing_informations_on_user_id", :unique => true

  create_table "presentations", :force => true do |t|
    t.string   "topic",               :null => false
    t.text     "description",         :null => false
    t.text     "speaker_description"
    t.string   "length",              :null => false
    t.integer  "user_id",             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presentations", ["user_id"], :name => "index_presentations_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "nick_name"
    t.string   "first_name",                         :null => false
    t.string   "last_name",                          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
