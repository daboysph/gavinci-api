# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_09_202429) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fuel_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.bigint "station_id", null: false
    t.bigint "fuel_type_id", null: false
    t.decimal "amount", precision: 5, scale: 3, null: false
    t.bigint "user_id"
    t.boolean "is_confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fuel_type_id"], name: "index_prices_on_fuel_type_id"
    t.index ["station_id", "fuel_type_id", "created_at"], name: "index_prices_on_station_id_and_fuel_type_id_and_created_at"
    t.index ["station_id"], name: "index_prices_on_station_id"
    t.index ["user_id"], name: "index_prices_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "station_id", null: false
    t.integer "rating", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_reviews_on_station_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name", null: false
    t.string "brand"
    t.string "address", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.boolean "is_open", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latitude", "longitude"], name: "index_stations_on_latitude_and_longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "prices", "fuel_types"
  add_foreign_key "prices", "stations"
  add_foreign_key "prices", "users"
  add_foreign_key "reviews", "stations"
  add_foreign_key "reviews", "users"
end
