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

ActiveRecord::Schema.define(version: 20180214220100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "station_id"
    t.index ["station_id"], name: "index_favorites_on_station_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "fuel_type"
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "hours_operation"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "role", default: 0
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.integer "year"
    t.integer "mpg"
    t.string "fuel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "favorites", "stations"
  add_foreign_key "favorites", "users"
  add_foreign_key "vehicles", "users"
end
