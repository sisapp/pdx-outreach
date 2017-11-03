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

ActiveRecord::Schema.define(version: 20171030070102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone"
    t.string "zip"
    t.text "notes"
    t.datetime "created_at", null: false
    t.index ["email"], name: "index_contacts_on_email", unique: true
  end

  create_table "contacts_groups", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "contact_id", null: false
    t.datetime "created_at", null: false
    t.index ["contact_id"], name: "index_contacts_groups_on_contact_id"
    t.index ["group_id", "contact_id"], name: "index_contacts_groups_on_group_id_and_contact_id", unique: true
    t.index ["group_id"], name: "index_contacts_groups_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.index ["name"], name: "index_groups_on_name", unique: true
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.index ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id", unique: true
    t.index ["group_id"], name: "index_groups_users_on_group_id"
    t.index ["user_id"], name: "index_groups_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "contacts_groups", "contacts"
  add_foreign_key "contacts_groups", "groups"
  add_foreign_key "groups_users", "groups"
  add_foreign_key "groups_users", "users"
end
