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

ActiveRecord::Schema.define(:version => 20101130161806) do

  create_table "bus_unit_places", :force => true do |t|
    t.integer  "unit_id",    :null => false
    t.integer  "number",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.integer  "user_id"
    t.text     "surname"
    t.text     "name"
    t.text     "patronic"
    t.datetime "birth_date"
    t.boolean  "banned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plane_unit_places", :force => true do |t|
    t.integer  "unit_id",    :null => false
    t.integer  "number",     :null => false
    t.integer  "category",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "route_dates", :force => true do |t|
    t.integer  "route_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "route_stations", :force => true do |t|
    t.integer  "route_id",   :null => false
    t.integer  "station_id", :null => false
    t.integer  "arr_day",    :null => false
    t.integer  "arr_hour",   :null => false
    t.integer  "arr_minute", :null => false
    t.integer  "dep_day",    :null => false
    t.integer  "dep_hour",   :null => false
    t.integer  "dep_minute", :null => false
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

  create_table "units", :force => true do |t|
    t.integer  "transport",   :null => false
    t.text     "description", :null => false
    t.text     "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.text     "username"
    t.text     "password"
    t.text     "email"
    t.datetime "created_at"
    t.text     "typ"
    t.datetime "updated_at"
  end

  create_table "wagon_unit_places", :force => true do |t|
    t.integer  "unit_id",    :null => false
    t.integer  "number",     :null => false
    t.integer  "category",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
