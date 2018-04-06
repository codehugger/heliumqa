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

ActiveRecord::Schema.define(version: 20180405124321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.text "name"
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
    t.bigint "scan_protocol_id"
    t.string "key", null: false
    t.jsonb "request_data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analysis_id"], name: "index_analysis_requests_on_analysis_id"
    t.index ["scan_protocol_id"], name: "index_analysis_requests_on_scan_protocol_id"
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
    t.text "key", null: false
    t.jsonb "response_data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analysis_request_id"], name: "index_analysis_responses_on_analysis_request_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.bigint "site_id"
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_equipment_on_site_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "inspection_file_previews", force: :cascade do |t|
    t.bigint "inspection_file_id"
    t.jsonb "file_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inspection_file_id"], name: "index_inspection_file_previews_on_inspection_file_id"
  end

  create_table "inspection_files", force: :cascade do |t|
    t.bigint "inspection_id"
    t.bigint "scan_protocol_id"
    t.bigint "scan_series_id"
    t.text "key", null: false
    t.text "filename"
    t.text "mime_type"
    t.text "modality"
    t.jsonb "file_data"
    t.jsonb "scan_header"
    t.datetime "file_metadata_extracted"
    t.datetime "scan_header_extracted"
    t.datetime "scan_protocol_matched"
    t.datetime "preview_generated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["filename"], name: "index_inspection_files_on_filename"
    t.index ["inspection_id"], name: "index_inspection_files_on_inspection_id"
    t.index ["scan_protocol_id"], name: "index_inspection_files_on_scan_protocol_id"
    t.index ["scan_series_id"], name: "index_inspection_files_on_scan_series_id"
  end

  create_table "inspections", force: :cascade do |t|
    t.bigint "equipment_id"
    t.text "key", null: false
    t.datetime "performed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_inspections_on_equipment_id"
  end

  create_table "mime_types", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scan_header_tags", force: :cascade do |t|
    t.bigint "value_type_id"
    t.bigint "mime_type_id"
    t.text "key"
    t.text "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_scan_header_tags_on_key"
    t.index ["label"], name: "index_scan_header_tags_on_label"
    t.index ["mime_type_id"], name: "index_scan_header_tags_on_mime_type_id"
    t.index ["value_type_id"], name: "index_scan_header_tags_on_value_type_id"
  end

  create_table "scan_protocol_matchers", force: :cascade do |t|
    t.bigint "scan_protocol_id"
    t.bigint "scan_header_tag_id"
    t.bigint "value_type_matcher_id"
    t.text "value"
    t.text "matcher", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scan_header_tag_id"], name: "index_scan_protocol_matchers_on_scan_header_tag_id"
    t.index ["scan_protocol_id"], name: "index_scan_protocol_matchers_on_scan_protocol_id"
    t.index ["value_type_matcher_id"], name: "index_scan_protocol_matchers_on_value_type_matcher_id"
  end

  create_table "scan_protocols", force: :cascade do |t|
    t.bigint "site_id"
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_scan_protocols_on_site_id"
  end

  create_table "scan_series", force: :cascade do |t|
    t.string "uid", null: false
    t.text "number", default: "n/a", null: false
    t.text "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_scan_series_on_uid", unique: true
  end

  create_table "sites", force: :cascade do |t|
    t.bigint "account_id"
    t.text "name"
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

  create_table "value_type_matchers", force: :cascade do |t|
    t.bigint "value_type_id"
    t.text "label"
    t.text "matcher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["value_type_id"], name: "index_value_type_matchers_on_value_type_id"
  end

  create_table "value_types", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "analyses", "inspections"
  add_foreign_key "analysis_request_files", "analysis_requests"
  add_foreign_key "analysis_request_files", "inspection_files"
  add_foreign_key "analysis_requests", "analyses"
  add_foreign_key "analysis_requests", "scan_protocols"
  add_foreign_key "analysis_response_files", "analysis_responses"
  add_foreign_key "analysis_responses", "analysis_requests"
  add_foreign_key "equipment", "sites"
  add_foreign_key "inspection_file_previews", "inspection_files"
  add_foreign_key "inspection_files", "inspections"
  add_foreign_key "inspection_files", "scan_protocols"
  add_foreign_key "inspections", "equipment"
  add_foreign_key "scan_protocol_matchers", "scan_header_tags"
  add_foreign_key "scan_protocol_matchers", "scan_protocols"
  add_foreign_key "scan_protocol_matchers", "value_type_matchers"
  add_foreign_key "scan_protocols", "sites"
  add_foreign_key "sites", "accounts"
  add_foreign_key "users", "accounts"
  add_foreign_key "value_type_matchers", "value_types"
end
