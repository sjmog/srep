# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_20_083451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "scheduler_records", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "things", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "webhook_url", null: false
    t.datetime "last_reminder"
    t.datetime "next_reminder"
  end

  create_table "webhook_responses", force: :cascade do |t|
    t.json "data"
    t.bigint "thing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["thing_id"], name: "index_webhook_responses_on_thing_id"
  end

  add_foreign_key "webhook_responses", "things"
end
