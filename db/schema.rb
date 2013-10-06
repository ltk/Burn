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

ActiveRecord::Schema.define(version: 20131006172736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "burners", force: true do |t|
    t.string   "slug",             null: false
    t.integer  "user_id",          null: false
    t.integer  "email_address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "burners", ["slug"], name: "index_burners_on_slug", unique: true, using: :btree

  create_table "email_addresses", force: true do |t|
    t.string   "address",                    null: false
    t.integer  "user_id",                    null: false
    t.boolean  "verified",   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "email_addresses", ["address", "user_id"], name: "index_email_addresses_on_address_and_user_id", unique: true, using: :btree
  add_index "email_addresses", ["user_id"], name: "index_email_addresses_on_user_id", using: :btree

  create_table "inbound_messages", force: true do |t|
    t.text     "raw",        null: false
    t.text     "headers",    null: false
    t.string   "from_email", null: false
    t.string   "from_name"
    t.text     "to",         null: false
    t.string   "email",      null: false
    t.text     "subject",    null: false
    t.integer  "spam_score", null: false
    t.string   "spf_result", null: false
    t.boolean  "dkim_valid", null: false
    t.integer  "burner_id",  null: false
    t.text     "html"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inbound_messages", ["burner_id"], name: "index_inbound_messages_on_burner_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "account_email"
    t.string   "crypted_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "burners", "users", :name => "burners_user_id_fk", :dependent => :delete

  add_foreign_key "email_addresses", "users", :name => "email_addresses_user_id_fk", :dependent => :delete

  add_foreign_key "inbound_messages", "burners", :name => "inbound_messages_burner_id_fk", :dependent => :delete

end
