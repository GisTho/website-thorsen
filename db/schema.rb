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

ActiveRecord::Schema.define(version: 20180617113640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
  end

  create_table "descriptions", force: :cascade do |t|
    t.string "title"
    t.text "data"
    t.bigint "author_id"
    t.index ["author_id"], name: "index_descriptions_on_author_id"
  end

  create_table "soft_skill_types", force: :cascade do |t|
    t.string "title"
  end

  create_table "soft_skills", force: :cascade do |t|
    t.string "title"
    t.bigint "soft_skill_type_id"
    t.index ["soft_skill_type_id"], name: "index_soft_skills_on_soft_skill_type_id"
  end

  create_table "technical_skill_types", force: :cascade do |t|
    t.string "title"
  end

  create_table "technical_skills", force: :cascade do |t|
    t.string "title"
    t.bigint "technical_skill_type_id"
    t.index ["technical_skill_type_id"], name: "index_technical_skills_on_technical_skill_type_id"
  end

  add_foreign_key "descriptions", "authors"
  add_foreign_key "soft_skills", "soft_skill_types"
  add_foreign_key "technical_skills", "technical_skill_types"
end
