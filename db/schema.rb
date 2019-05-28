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

ActiveRecord::Schema.define(version: 2019_05_25_221129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "client_conversations", force: :cascade do |t|
    t.bigint "from_client_id"
    t.bigint "to_client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_client_id"], name: "index_client_conversations_on_from_client_id"
    t.index ["to_client_id"], name: "index_client_conversations_on_to_client_id"
  end

  create_table "group_conversation_users", force: :cascade do |t|
    t.bigint "group_conversation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_conversation_id"], name: "index_group_conversation_users_on_group_conversation_id"
    t.index ["user_id"], name: "index_group_conversation_users_on_user_id"
  end

  create_table "group_conversations", force: :cascade do |t|
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_group_conversations_on_author_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "ticket_conversation_id"
    t.bigint "user_id"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_conversation_id"], name: "index_messages_on_ticket_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "ticket_comments", force: :cascade do |t|
    t.bigint "ticket_conversation_id"
    t.bigint "user_id"
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_conversation_id"], name: "index_ticket_comments_on_ticket_conversation_id"
    t.index ["user_id"], name: "index_ticket_comments_on_user_id"
  end

  create_table "ticket_conversations", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "manager_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_ticket_conversations_on_client_id"
    t.index ["manager_id"], name: "index_ticket_conversations_on_manager_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 1
    t.string "first_name"
    t.string "last_name"
    t.integer "gender"
    t.string "phone"
    t.string "address"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "client_conversations", "users", column: "from_client_id"
  add_foreign_key "client_conversations", "users", column: "to_client_id"
  add_foreign_key "group_conversation_users", "group_conversations"
  add_foreign_key "group_conversation_users", "users"
  add_foreign_key "group_conversations", "users", column: "author_id"
  add_foreign_key "messages", "ticket_conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "ticket_comments", "ticket_conversations"
  add_foreign_key "ticket_comments", "users"
  add_foreign_key "ticket_conversations", "users", column: "client_id"
  add_foreign_key "ticket_conversations", "users", column: "manager_id"
end
