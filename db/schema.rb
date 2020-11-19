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

ActiveRecord::Schema.define(version: 2020_11_19_132709) do

  create_table "resources", force: :cascade do |t|
    t.string "url"
    t.string "description"
    t.integer "user_id", null: false
    t.integer "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "site_name"
    t.index ["topic_id"], name: "index_resources_on_topic_id"
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "stars"
    t.string "title"
    t.string "comment"
    t.integer "user_id", null: false
    t.integer "resource_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_id"], name: "index_reviews_on_resource_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "resources", "topics"
  add_foreign_key "resources", "users"
  add_foreign_key "reviews", "resources"
  add_foreign_key "reviews", "users"
end
