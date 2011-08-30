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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110829191929) do

  create_table "card_images", :force => true do |t|
    t.integer  "size"
    t.binary   "data"
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "card_id"
  end

  create_table "card_manas", :force => true do |t|
    t.integer  "mana_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "card_id"
    t.integer  "mana_id"
  end

  create_table "cards", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cost"
    t.integer  "strength"
    t.integer  "toughness"
    t.string   "category"
    t.integer  "number"
    t.string   "artist"
    t.string   "description"
    t.string   "flavor"
    t.integer  "identifier"
    t.integer  "color_id"
    t.integer  "rarity_id"
  end

  create_table "colors", :force => true do |t|
    t.string   "identifier"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manas", :force => true do |t|
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rarities", :force => true do |t|
    t.string   "identifier"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
