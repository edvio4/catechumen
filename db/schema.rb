# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160122184730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "curriculums", force: :cascade do |t|
    t.integer  "resource_id",                    null: false
    t.integer  "student_id",                     null: false
    t.integer  "schedule_id"
    t.string   "date_completed", default: "",    null: false
    t.boolean  "completed",      default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "curriculums", ["resource_id", "student_id"], name: "index_curriculums_on_resource_id_and_student_id", unique: true, using: :btree

  create_table "division_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "division_types", ["name"], name: "index_division_types_on_name", unique: true, using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "curriculum_id",                  null: false
    t.string   "unit",                           null: false
    t.string   "division_unit",  default: "",    null: false
    t.string   "date_completed", default: "",    null: false
    t.boolean  "completed",      default: false
    t.string   "scheduled_date", default: "",    null: false
    t.integer  "duration",       default: 0,     null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "lessons", ["unit", "curriculum_id", "division_unit"], name: "index_lessons_on_unit_and_curriculum_id_and_division_unit", unique: true, using: :btree

  create_table "occurrences", force: :cascade do |t|
    t.string   "day",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "occurrences", ["day"], name: "index_occurrences_on_day", unique: true, using: :btree

  create_table "paces", force: :cascade do |t|
    t.string   "pace",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "paces", ["pace"], name: "index_paces_on_pace", unique: true, using: :btree

  create_table "recurrences", force: :cascade do |t|
    t.integer  "schedule_id",   null: false
    t.integer  "occurrence_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "recurrences", ["schedule_id", "occurrence_id"], name: "index_recurrences_on_schedule_id_and_occurrence_id", unique: true, using: :btree

  create_table "resources", force: :cascade do |t|
    t.string   "title",                         null: false
    t.string   "units",                         null: false
    t.integer  "unit_type_id",                  null: false
    t.string   "division_units",   default: "", null: false
    t.integer  "division_type_id"
    t.integer  "subject_id",                    null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "resources", ["title"], name: "index_resources_on_title", unique: true, using: :btree

  create_table "schedules", force: :cascade do |t|
    t.integer  "curriculum_id", null: false
    t.string   "pace_id",       null: false
    t.string   "start_date",    null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "schedules", ["curriculum_id"], name: "index_schedules_on_curriculum_id", unique: true, using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "students", ["name"], name: "index_students_on_name", unique: true, using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subjects", ["name"], name: "index_subjects_on_name", unique: true, using: :btree

  create_table "unit_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "unit_types", ["name"], name: "index_unit_types_on_name", unique: true, using: :btree

end
