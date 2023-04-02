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

ActiveRecord::Schema.define(version: 2023_03_19_072920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "school_id", null: false
    t.bigint "course_id", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_batches_on_course_id"
    t.index ["name"], name: "index_batches_on_name"
    t.index ["school_id"], name: "index_batches_on_school_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "school_id"
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_courses_on_school_id"
  end

  create_table "enrollment_requests", force: :cascade do |t|
    t.bigint "batch_id", null: false
    t.integer "student_id", null: false
    t.integer "status", default: 0, null: false
    t.integer "approved_by"
    t.datetime "approved_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["batch_id"], name: "index_enrollment_requests_on_batch_id"
    t.index ["student_id"], name: "index_enrollment_requests_on_student_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "address", default: "", null: false
    t.string "email", default: "", null: false
    t.integer "admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_schools_on_admin_id"
    t.index ["name"], name: "index_schools_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "role", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batches", "courses"
  add_foreign_key "batches", "schools"
  add_foreign_key "courses", "schools"
  add_foreign_key "enrollment_requests", "batches"
end
