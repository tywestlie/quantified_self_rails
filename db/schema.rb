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

ActiveRecord::Schema.define(version: 2018_08_13_215236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_foods", force: :cascade do |t|
    t.bigint "meals_id"
    t.bigint "foods_id"
    t.index ["foods_id"], name: "index_meal_foods_on_foods_id"
    t.index ["meals_id"], name: "index_meal_foods_on_meals_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "meal_foods", "foods", column: "foods_id"
  add_foreign_key "meal_foods", "meals", column: "meals_id"
end
