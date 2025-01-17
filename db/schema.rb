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

ActiveRecord::Schema.define(version: 2019_12_01_135800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interviews", force: :cascade do |t|
    t.bigint "job_application_id"
    t.datetime "date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "interviewer_name"
    t.string "interviewer_email"
    t.index ["job_application_id"], name: "index_interviews_on_job_application_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id"
    t.string "job_title"
    t.string "company_name"
    t.string "recruiter_name"
    t.string "recruiter_email"
    t.boolean "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "your_impression"
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "interviews", "job_applications"
  add_foreign_key "job_applications", "users"
  add_foreign_key "profiles", "users"
end
