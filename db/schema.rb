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

ActiveRecord::Schema.define(version: 2023_04_12_024944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cust_subs", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "subscription_id"
    t.index ["customer_id"], name: "index_cust_subs_on_customer_id"
    t.index ["subscription_id"], name: "index_cust_subs_on_subscription_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "title", null: false
    t.float "price", null: false
    t.integer "status", null: false
    t.integer "frequency", null: false
    t.bigint "tea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tea_id"], name: "index_subscriptions_on_tea_id"
  end

  create_table "teas", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.integer "temperature", null: false
    t.integer "brew_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cust_subs", "customers"
  add_foreign_key "cust_subs", "subscriptions"
  add_foreign_key "subscriptions", "teas"
end
