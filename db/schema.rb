# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_18_222454) do

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 200, collation: "utf8_unicode_ci"
    t.bigint "nip"
    t.string "address", limit: 200, collation: "utf8_unicode_ci"
    t.string "city", limit: 100, collation: "utf8_unicode_ci"
    t.boolean "is_deleted"
    t.bigint "industry_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industry_id"], name: "index_companies_on_industry_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "contact_people", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 50, collation: "utf8_unicode_ci"
    t.string "surname", limit: 100, collation: "utf8_unicode_ci"
    t.string "phone", limit: 20, collation: "utf8_unicode_ci"
    t.string "email", limit: 150, collation: "utf8_unicode_ci"
    t.string "position", limit: 100, collation: "utf8_unicode_ci"
    t.boolean "is_deleted"
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_contact_people_on_company_id"
    t.index ["user_id"], name: "index_contact_people_on_user_id"
  end

  create_table "industries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 50, collation: "utf8_unicode_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "content", collation: "utf8_unicode_ci"
    t.boolean "is_deleted"
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_notes_on_company_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 50, collation: "utf8_unicode_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 50, collation: "utf8_unicode_ci"
    t.string "surname", limit: 100, collation: "utf8_unicode_ci"
    t.date "date_of_birth"
    t.string "login", limit: 50, collation: "utf8_unicode_ci"
    t.string "password_digest", limit: 150, collation: "utf8_unicode_ci"
    t.boolean "is_deleted"
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "companies", "industries"
  add_foreign_key "companies", "users"
  add_foreign_key "contact_people", "companies"
  add_foreign_key "contact_people", "users"
  add_foreign_key "notes", "companies"
  add_foreign_key "notes", "users"
  add_foreign_key "users", "roles"
end
