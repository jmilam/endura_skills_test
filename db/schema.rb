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

ActiveRecord::Schema.define(version: 20170106135227) do

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "part_num"
    t.integer  "question_num"
    t.string   "answer"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "test_num"
  end

  create_table "logins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "complete",               default: false
    t.boolean  "admin",                  default: false
    t.date     "completed_date"
    t.index ["email"], name: "index_logins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_logins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "user_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.string   "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_user_answers_on_answer_id", using: :btree
    t.index ["user_id", "answer_id"], name: "index_user_answers_on_user_id_and_answer_id", using: :btree
    t.index ["user_id"], name: "index_user_answers_on_user_id", using: :btree
  end

  create_table "user_tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.boolean "complete"
    t.date    "completed_date"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "email"
    t.boolean  "complete"
    t.date     "completed_date"
    t.string   "test_num"
  end

end
