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

ActiveRecord::Schema.define(version: 2021_06_02_224728) do

  create_table "accounts", force: :cascade do |t|
    t.string "company_name", null: false
    t.string "address", null: false
    t.string "phone", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "connections", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "contact_id"
    t.integer "product_id"
    t.integer "opportunity_id"
    t.integer "account_id", null: false
    t.text "notes", null: false
    t.string "connection_type", null: false
    t.boolean "opportunity_check", default: false, null: false
    t.index ["account_id"], name: "index_connections_on_account_id"
    t.index ["contact_id"], name: "index_connections_on_contact_id"
    t.index ["opportunity_id"], name: "index_connections_on_opportunity_id"
    t.index ["product_id"], name: "index_connections_on_product_id"
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.string "role"
    t.integer "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "connection_id"
    t.index ["account_id"], name: "index_contacts_on_account_id"
    t.index ["connection_id"], name: "index_contacts_on_connection_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "contacts_opportunities", id: false, force: :cascade do |t|
    t.integer "opportunity_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id", "opportunity_id"], name: "index_contacts_opportunities_on_contact_id_and_opportunity_id"
    t.index ["opportunity_id", "contact_id"], name: "index_contacts_opportunities_on_opportunity_id_and_contact_id"
  end

  create_table "opportunities", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "product_id", null: false
    t.integer "contact_id", null: false
    t.integer "user_id", null: false
    t.index ["account_id"], name: "index_opportunities_on_account_id"
    t.index ["contact_id"], name: "index_opportunities_on_contact_id"
    t.index ["product_id"], name: "index_opportunities_on_product_id"
    t.index ["user_id"], name: "index_opportunities_on_user_id"
  end

  create_table "opportunities_products", id: false, force: :cascade do |t|
    t.integer "opportunity_id", null: false
    t.integer "product_id", null: false
    t.index ["opportunity_id", "product_id"], name: "index_opportunities_products_on_opportunity_id_and_product_id"
    t.index ["product_id", "opportunity_id"], name: "index_opportunities_products_on_product_id_and_opportunity_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.decimal "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.string "image_link"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.string "reply", null: false
    t.integer "comment_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_replies_on_comment_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "date", null: false
    t.text "notes", null: false
    t.integer "contact_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["contact_id"], name: "index_tasks_on_contact_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "role"
    t.string "google_refresh_token"
    t.string "google_token"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "connections", "accounts"
  add_foreign_key "connections", "contacts"
  add_foreign_key "connections", "opportunities"
  add_foreign_key "connections", "products"
  add_foreign_key "connections", "users"
  add_foreign_key "contacts", "accounts"
  add_foreign_key "contacts", "connections"
  add_foreign_key "contacts", "users"
  add_foreign_key "opportunities", "accounts"
  add_foreign_key "opportunities", "contacts"
  add_foreign_key "opportunities", "products"
  add_foreign_key "opportunities", "users"
  add_foreign_key "products", "users"
  add_foreign_key "replies", "comments"
  add_foreign_key "replies", "users"
  add_foreign_key "suggestions", "users"
  add_foreign_key "tasks", "contacts"
  add_foreign_key "tasks", "users"
end
