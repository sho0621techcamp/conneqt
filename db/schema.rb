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

ActiveRecord::Schema.define(version: 2020_11_02_072527) do

  create_table "lang_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tag", null: false
    t.integer "star", null: false
    t.bigint "user_id"
    t.bigint "tutor_id"
    t.bigint "messages_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["messages_id"], name: "index_lang_tags_on_messages_id"
    t.index ["tutor_id"], name: "index_lang_tags_on_tutor_id"
    t.index ["user_id"], name: "index_lang_tags_on_user_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "issue_title", null: false
    t.text "issue_text", null: false
    t.bigint "user_id"
    t.bigint "tutor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tutor_id"], name: "index_messages_on_tutor_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "tutors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tutor_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.text "tutor_introduction", null: false
    t.text "github_account", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_tutors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tutors_on_reset_password_token", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.text "introduction", null: false
    t.text "github_account"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lang_tags", "messages", column: "messages_id"
  add_foreign_key "lang_tags", "tutors"
  add_foreign_key "lang_tags", "users"
  add_foreign_key "messages", "tutors"
  add_foreign_key "messages", "users"
end
