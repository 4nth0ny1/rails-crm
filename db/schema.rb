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

ActiveRecord::Schema.define(version: 2021_05_16_173249) do

  create_table "accounts", force: :cascade do |t|
    t.string "company_name"
    t.string "address"
    t.string "phone"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "accounts_contacts", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "contact_id", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "role"
    t.integer "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_contacts_on_account_id"
  end

  create_table "contacts_opportunities", id: false, force: :cascade do |t|
    t.integer "opportunity_id", null: false
    t.integer "contact_id", null: false
  end

  create_table "opportunities", force: :cascade do |t|
    t.string "products"
    t.string "contacts"
    t.integer "account_id", null: false
    t.integer "contact_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_opportunities_on_account_id"
    t.index ["contact_id"], name: "index_opportunities_on_contact_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "google_token"
    t.string "google_refresh_token"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "contacts", "accounts"
  add_foreign_key "opportunities", "accounts"
  add_foreign_key "opportunities", "contacts"
end
