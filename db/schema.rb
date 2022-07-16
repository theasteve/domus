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

ActiveRecord::Schema[7.0].define(version: 2022_07_16_033305) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.string "building_name"
    t.string "address_line_one"
    t.string "address_line_two"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "country"
    t.bigint "property_owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_owner_id"], name: "index_properties_on_property_owner_id"
  end

  create_table "property_owners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "date_of_birth"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.date "lease_start_date"
    t.date "lease_end_date"
    t.text "notes"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_tenants_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "apartment_name"
    t.string "status"
    t.float "monthly_rent_cents"
    t.integer "rooms"
    t.text "notes"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_units_on_property_id"
  end

  add_foreign_key "properties", "property_owners"
  add_foreign_key "tenants", "units"
  add_foreign_key "units", "properties"
end