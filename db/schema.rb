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

ActiveRecord::Schema.define(version: 2019_06_03_005053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "current_weathers", force: :cascade do |t|
    t.float "temperature"
    t.float "feels_like"
    t.float "temp_high"
    t.float "temp_low"
    t.float "humidity"
    t.float "visibility"
    t.float "uv_index"
    t.string "current_summary"
    t.string "icon"
    t.string "today_summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_weathers", force: :cascade do |t|
    t.jsonb "daily_weather_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hourly_weathers", force: :cascade do |t|
    t.jsonb "hourly_weather_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "current_weather_id"
    t.bigint "hourly_weathers_id"
    t.bigint "daily_weathers_id"
    t.index ["current_weather_id"], name: "index_locations_on_current_weather_id"
    t.index ["daily_weathers_id"], name: "index_locations_on_daily_weathers_id"
    t.index ["hourly_weathers_id"], name: "index_locations_on_hourly_weathers_id"
  end

  add_foreign_key "locations", "current_weathers"
  add_foreign_key "locations", "daily_weathers", column: "daily_weathers_id"
  add_foreign_key "locations", "hourly_weathers", column: "hourly_weathers_id"
end
