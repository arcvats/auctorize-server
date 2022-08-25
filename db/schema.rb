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

ActiveRecord::Schema[7.0].define(version: 2022_08_03_011944) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "group_roles", force: :cascade do |t|
    t.integer "group_id"
    t.integer "role_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "uid", null: false
    t.string "name", null: false
    t.text "description"
    t.boolean "default", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "name_groups_idx_02", unique: true
    t.index ["uid"], name: "uid_groups_idx_01", unique: true
  end

  create_table "organizations", force: :cascade do |t|
    t.string "uid", null: false
    t.string "name", null: false
    t.text "description"
    t.string "subdomain"
    t.string "email"
    t.string "timezone"
    t.string "language", default: "en", null: false
    t.bigint "api_rate_limit"
    t.string "access_token", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "name_organizations_idx_02", unique: true
    t.index ["subdomain"], name: "subdomain_organizations_idx_03", unique: true
    t.index ["uid"], name: "uid_organizations_idx_01", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "uid", null: false
    t.string "name", null: false
    t.text "description"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "name_roles_idx_02", unique: true
    t.index ["uid"], name: "uid_roles_idx_01", unique: true
  end

  create_table "user_groups", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "uid", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "active", default: false, null: false
    t.boolean "api_access", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "verification_token"
    t.datetime "verified_at"
    t.datetime "verification_sent_at"
    t.string "unverified_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "timezone"
    t.string "language", default: "en", null: false
    t.datetime "deleted_at"
    t.integer "organization_id"
    t.integer "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "email_users_idx_02", unique: true
    t.index ["uid"], name: "uid_users_idx_01", unique: true
  end

end
