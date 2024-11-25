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

ActiveRecord::Schema[7.2].define(version: 2024_11_19_083728) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.boolean "correct"
    t.json "lines"
    t.integer "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "asb_sitting_id", null: false
    t.float "marks"
    t.index ["asb_sitting_id"], name: "index_answers_on_asb_sitting_id"
    t.index ["student_id"], name: "index_answers_on_student_id"
  end

  create_table "asb_classes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "current_section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_asb_classes_on_user_id"
  end

  create_table "asb_results", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.json "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "asb_sitting_id", null: false
    t.index ["asb_sitting_id"], name: "index_asb_results_on_asb_sitting_id"
    t.index ["student_id"], name: "index_asb_results_on_student_id"
  end

  create_table "asb_sittings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "current_section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_asb_sittings_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.string "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.date "date_of_birth"
    t.string "home_language"
    t.string "lolt"
    t.boolean "attend_grade_one"
    t.boolean "repeating_grade_one"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "login_type"
    t.string "role"
    t.integer "manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
    t.string "gender"
    t.integer "yos"
    t.text "qualification"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "answers", "asb_sittings"
  add_foreign_key "answers", "students"
  add_foreign_key "asb_classes", "users"
  add_foreign_key "asb_results", "asb_sittings"
  add_foreign_key "asb_results", "students"
  add_foreign_key "asb_sittings", "users"
  add_foreign_key "students", "users"
end
