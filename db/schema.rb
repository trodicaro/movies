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

ActiveRecord::Schema.define(version: 20180408040127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "backdrop_path"
    t.text "overview"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "total_cost", precision: 5, scale: 2
    t.integer "seat_count"
    t.bigint "customer_id"
    t.bigint "screening_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["screening_id"], name: "index_orders_on_screening_id"
  end

  create_table "screenings", force: :cascade do |t|
    t.datetime "scheduled_at"
    t.bigint "movie_id"
    t.bigint "theater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_screenings_on_movie_id"
    t.index ["theater_id"], name: "index_screenings_on_theater_id"
  end

  create_table "theaters", force: :cascade do |t|
    t.string "name"
    t.integer "seating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "screenings"
  add_foreign_key "screenings", "movies"
  add_foreign_key "screenings", "theaters"
end
