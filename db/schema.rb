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

ActiveRecord::Schema.define(version: 20180206064918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "analyses", force: :cascade do |t|
    t.bigint "inspection_id"
    t.string "key", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inspection_id"], name: "index_analyses_on_inspection_id"
  end

  create_table "analysis_request_files", force: :cascade do |t|
    t.bigint "analysis_request_id"
    t.bigint "inspection_file_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analysis_request_id"], name: "index_analysis_request_files_on_analysis_request_id"
    t.index ["inspection_file_id"], name: "index_analysis_request_files_on_inspection_file_id"
  end

  create_table "analysis_requests", force: :cascade do |t|
    t.bigint "analysis_id"
    t.bigint "equipment_profile_id"
    t.string "key", null: false
    t.jsonb "request_data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analysis_id"], name: "index_analysis_requests_on_analysis_id"
    t.index ["equipment_profile_id"], name: "index_analysis_requests_on_equipment_profile_id"
  end

  create_table "analysis_response_files", force: :cascade do |t|
    t.bigint "analysis_response_id"
    t.jsonb "file_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analysis_response_id"], name: "index_analysis_response_files_on_analysis_response_id"
  end

  create_table "analysis_responses", force: :cascade do |t|
    t.bigint "analysis_request_id"
    t.string "key", null: false
    t.jsonb "response_data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analysis_request_id"], name: "index_analysis_responses_on_analysis_request_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.bigint "site_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_equipment_on_site_id"
  end

  create_table "equipment_profiles", force: :cascade do |t|
    t.bigint "site_id"
    t.string "name"
    t.jsonb "profile_data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_equipment_profiles_on_site_id"
  end

  create_table "inspection_files", force: :cascade do |t|
    t.bigint "inspection_id"
    t.bigint "equipment_profile_id"
    t.jsonb "file_data"
    t.jsonb "profile_header"
    t.datetime "profiled_at"
    t.datetime "probed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_profile_id"], name: "index_inspection_files_on_equipment_profile_id"
    t.index ["inspection_id"], name: "index_inspection_files_on_inspection_id"
  end

  create_table "inspections", force: :cascade do |t|
    t.bigint "equipment_id"
    t.string "key", null: false
    t.datetime "performed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_inspections_on_equipment_id"
  end

  create_table "sites", force: :cascade do |t|
    t.bigint "account_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_sites_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "analyses", "inspections"
  add_foreign_key "analysis_request_files", "analysis_requests"
  add_foreign_key "analysis_request_files", "inspection_files"
  add_foreign_key "analysis_requests", "analyses"
  add_foreign_key "analysis_requests", "equipment_profiles"
  add_foreign_key "analysis_response_files", "analysis_responses"
  add_foreign_key "analysis_responses", "analysis_requests"
  add_foreign_key "equipment", "sites"
  add_foreign_key "equipment_profiles", "sites"
  add_foreign_key "inspection_files", "equipment_profiles"
  add_foreign_key "inspection_files", "inspections"
  add_foreign_key "inspections", "equipment"
  add_foreign_key "sites", "accounts"
  add_foreign_key "users", "accounts"
end
