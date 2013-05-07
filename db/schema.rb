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

ActiveRecord::Schema.define(:version => 20100601101753) do

  create_table "log_messages", :force => true do |t|
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rentals", :force => true do |t|
    t.text     "comment"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subject_id"
    t.string   "user"
    t.datetime "to_date"
    t.datetime "from_date"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.text     "comment"
    t.string   "kennzeichen"
    t.string   "notify_address"
    t.boolean  "usable"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

end
