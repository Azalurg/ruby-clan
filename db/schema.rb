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

ActiveRecord::Schema[7.1].define(version: 2023_11_16_134950) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backgrounds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_names", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "heros", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "race_id", null: false
    t.bigint "class_name_id", null: false
    t.bigint "background_id", null: false
    t.integer "level", null: false
    t.integer "exp"
    t.integer "free_points"
    t.integer "str"
    t.integer "dex"
    t.integer "int"
    t.integer "con"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["background_id"], name: "index_heros_on_background_id"
    t.index ["class_name_id"], name: "index_heros_on_class_name_id"
    t.index ["race_id"], name: "index_heros_on_race_id"
  end

  create_table "quests", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "reward_exp", null: false
    t.integer "reward_level", null: false
    t.integer "max_level"
    t.integer "min_level"
    t.bigint "race_id"
    t.bigint "class_name_id"
    t.bigint "background_id"
    t.bigint "owner_id", null: false
    t.bigint "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["background_id"], name: "index_quests_on_background_id"
    t.index ["class_name_id"], name: "index_quests_on_class_name_id"
    t.index ["creator_id"], name: "index_quests_on_creator_id"
    t.index ["owner_id"], name: "index_quests_on_owner_id"
    t.index ["race_id"], name: "index_quests_on_race_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "heros", "backgrounds"
  add_foreign_key "heros", "class_names"
  add_foreign_key "heros", "races"
  add_foreign_key "quests", "backgrounds"
  add_foreign_key "quests", "class_names"
  add_foreign_key "quests", "heros", column: "creator_id"
  add_foreign_key "quests", "heros", column: "owner_id"
  add_foreign_key "quests", "races"
end
