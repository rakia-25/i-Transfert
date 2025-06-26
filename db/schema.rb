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

ActiveRecord::Schema[7.1].define(version: 2025_06_25_100739) do
  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id", null: false
    t.index ["city_id"], name: "index_agencies_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deposits", force: :cascade do |t|
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guichets", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "agency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "solde"
    t.integer "user_id", null: false
    t.index ["agency_id"], name: "index_guichets_on_agency_id"
    t.index ["user_id"], name: "index_guichets_on_user_id"
  end

  create_table "historicals", force: :cascade do |t|
    t.decimal "balance_before"
    t.decimal "balance_after"
    t.integer "guichet_id", null: false
    t.string "operation_type", null: false
    t.integer "operation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guichet_id"], name: "index_historicals_on_guichet_id"
    t.index ["operation_type", "operation_id"], name: "index_historicals_on_operation"
  end

  create_table "transferts", force: :cascade do |t|
    t.string "sender_name"
    t.string "sender_number"
    t.string "destination"
    t.decimal "amount"
    t.string "recipient_name"
    t.string "recipient_number"
    t.string "transaction_type"
    t.string "reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "withdraws", force: :cascade do |t|
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "agencies", "cities"
  add_foreign_key "cities", "countries"
  add_foreign_key "guichets", "agencies"
  add_foreign_key "guichets", "users"
  add_foreign_key "historicals", "guichets"
end
