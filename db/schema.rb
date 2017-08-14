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

ActiveRecord::Schema.define(version: 0) do

  create_table "cards", id: :text, force: :cascade do |t|
    t.text "name"
    t.text "flavor"
    t.text "text"
    t.text "artist"
    t.integer "attack"
    t.text "cardClass"
    t.integer "cost"
    t.text "faction"
    t.integer "health"
    t.text "mechanics"
    t.text "multiClassGroup"
    t.text "race"
    t.text "rarity"
    t.text "set"
    t.text "type"
    t.text "cardType"
    t.index ["id"], name: "sqlite_autoindex_cards_1", unique: true
  end

  create_table "filters", force: :cascade do |t|
    t.integer "user_id"
    t.text "filter_name"
    t.text "name"
    t.text "artist"
    t.integer "attack"
    t.text "cardClass"
    t.integer "cost"
    t.text "faction"
    t.integer "health"
    t.text "mechanics"
    t.text "multiClassGroup"
    t.text "race"
    t.text "rarity"
    t.text "set"
    t.text "cardType"
    t.index ["user_id"], name: "index_filters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "created_at"
    t.text "updated_at"
    t.text "password_digest"
  end

end
