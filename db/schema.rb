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

ActiveRecord::Schema.define(version: 2019_08_06_215205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "measure_id"
    t.integer "my_meal_id"
    t.integer "food_id"
    t.integer "qty"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "my_meal_id"
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

  create_table "measures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_meals", primary_key: "idMeal", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "instructions"
    t.string "mealThumb", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_meals_weeks", id: false, force: :cascade do |t|
    t.bigint "week_id", null: false
    t.bigint "my_meal_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "user_name"
    t.boolean "super", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "info", default: true
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "user_id"
    t.text "days", default: [], array: true
    t.text "grocery"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
