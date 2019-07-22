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

ActiveRecord::Schema.define(version: 2019_07_19_214225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "meal_id"
    t.string "meal_string"
    t.boolean "week_plan", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.text "recipe"
    t.integer "user_id"
    t.string "name"
    t.string "img_url"
    t.string "meal_id_string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals_weeks", id: false, force: :cascade do |t|
    t.bigint "week_id", null: false
    t.bigint "meal_id", null: false
    t.index ["meal_id", "week_id"], name: "index_meals_weeks_on_meal_id_and_week_id"
    t.index ["week_id", "meal_id"], name: "index_meals_weeks_on_week_id_and_meal_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "user_name"
    t.boolean "super", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "user_id"
    t.text "days", default: [], array: true
    t.text "grocery"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
