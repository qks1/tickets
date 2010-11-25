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

ActiveRecord::Schema.define(:version => 20101124233940) do

  create_table "providers", :force => true do |t|
    t.text     "company_name", :null => false
    t.text     "jur_address",  :null => false
    t.text     "fact_address", :null => false
    t.integer  "phone",        :null => false
    t.text     "email",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "site"
  end

  create_table "route_stations", :force => true do |t|
    t.integer  "route_id",   :null => false
    t.integer  "station_id", :null => false
    t.text     "arr_time",   :null => false
    t.text     "dep_time",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", :force => true do |t|
    t.integer  "provider_id", :null => false
    t.text     "number",      :null => false
    t.integer  "transport",   :null => false
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stations", :force => true do |t|
    t.text     "name",       :null => false
    t.text     "city",       :null => false
    t.integer  "transport",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
