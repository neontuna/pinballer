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

ActiveRecord::Schema.define(version: 20170906011301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "matchplay_events", force: :cascade do |t|
    t.string "matchplay_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matchplay_events_players", id: false, force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "matchplay_event_id", null: false
    t.index ["matchplay_event_id", "player_id"], name: "matchplay_players_index"
  end

  create_table "players", force: :cascade do |t|
    t.jsonb "ifpa_stats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ifpa_id"
    t.string "matchplay_player_id"
  end

end
