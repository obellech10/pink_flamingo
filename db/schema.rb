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

ActiveRecord::Schema.define(version: 2019_09_05_224159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credentials", force: :cascade do |t|
    t.string "uid"
    t.string "provider"
    t.string "token"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_credentials_on_user_id"
  end

  create_table "event_attendees", force: :cascade do |t|
    t.integer "number_of_guests"
    t.bigint "user_id"
    t.bigint "event_id"
    t.integer "rsvp"
    t.integer "number_of_guests"
    t.index ["event_id"], name: "index_event_attendees_on_event_id"
    t.index ["user_id"], name: "index_event_attendees_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "date"
    t.string "time"
    t.string "address"
    t.bigint "user_id"
    t.string "event_type"
    t.boolean "food"
    t.boolean "booze"
    t.string "restrictions"
    t.string "title"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.integer "phone"
    t.string "email"
  end

  add_foreign_key "credentials", "users"
  add_foreign_key "event_attendees", "events"
  add_foreign_key "event_attendees", "users"
  add_foreign_key "events", "users"
end
