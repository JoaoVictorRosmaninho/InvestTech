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

ActiveRecord::Schema[7.0].define(version: 2022_03_03_213213) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cash_transactions", force: :cascade do |t|
    t.text "desc_transaction"
    t.float "value_transaction"
    t.date "date_transaction"
    t.integer "fund_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funds", force: :cascade do |t|
    t.string "name_fund"
    t.text "desc_fund"
    t.date "creation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "securities", force: :cascade do |t|
    t.string "security_simbol"
    t.date "creation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "security_desc"
  end

  create_table "securitys_closing_prices", force: :cascade do |t|
    t.float "closing_price"
    t.date "date_closing"
    t.integer "security_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "securitys_transactions", force: :cascade do |t|
    t.text "desc_transaction"
    t.float "value_transaction"
    t.date "date_transaction"
    t.integer "fund_id"
    t.integer "security_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
  end

  add_foreign_key "cash_transactions", "funds"
  add_foreign_key "securitys_closing_prices", "securities"
  add_foreign_key "securitys_transactions", "funds"
  add_foreign_key "securitys_transactions", "securities"
end
