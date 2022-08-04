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

ActiveRecord::Schema[7.0].define(version: 2022_08_04_153919) do
  create_table "petitions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.boolean "victory"
    t.string "status"
    t.index ["user_id"], name: "index_petitions_on_user_id"
  end

  create_table "signatures", force: :cascade do |t|
    t.text "message"
    t.boolean "private"
    t.integer "user_id", null: false
    t.integer "petition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["petition_id"], name: "index_signatures_on_petition_id"
    t.index ["user_id"], name: "index_signatures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.text "about_me"
    t.string "country"
    t.string "twitter_username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "petitions", "users"
  add_foreign_key "signatures", "petitions"
  add_foreign_key "signatures", "users"
end
