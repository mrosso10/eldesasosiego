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

ActiveRecord::Schema.define(version: 2021_06_23_231103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

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

  create_table "candidatos", force: :cascade do |t|
    t.string "texto"
    t.string "tipo_query"
    t.integer "longanismo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pagina_id"
    t.index ["pagina_id"], name: "index_candidatos_on_pagina_id"
  end

  create_table "contactos", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "email", null: false
    t.string "mensaje", null: false
    t.string "ip", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_contactos_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "alt"
    t.string "hint"
    t.string "file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "paginas", force: :cascade do |t|
    t.string "texto"
    t.integer "numero"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "post_categories", force: :cascade do |t|
    t.string "nombre"
    t.bigint "creado_por_id"
    t.bigint "actualizado_por_id"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actualizado_por_id"], name: "index_post_categories_on_actualizado_por_id"
    t.index ["creado_por_id"], name: "index_post_categories_on_creado_por_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "titulo"
    t.boolean "activo"
    t.string "slug"
    t.text "contenido"
    t.bigint "post_category_id", null: false
    t.bigint "creado_por_id"
    t.bigint "actualizado_por_id"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actualizado_por_id"], name: "index_posts_on_actualizado_por_id"
    t.index ["creado_por_id"], name: "index_posts_on_creado_por_id"
    t.index ["post_category_id"], name: "index_posts_on_post_category_id"
  end

  create_table "tuits", force: :cascade do |t|
    t.string "texto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "activo", default: true
    t.integer "edad"
    t.boolean "desarrollador", default: false
    t.string "nombre"
    t.string "profiles"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "candidatos", "paginas"
  add_foreign_key "contactos", "users"
  add_foreign_key "post_categories", "users", column: "actualizado_por_id"
  add_foreign_key "post_categories", "users", column: "creado_por_id"
  add_foreign_key "posts", "post_categories"
  add_foreign_key "posts", "users", column: "actualizado_por_id"
  add_foreign_key "posts", "users", column: "creado_por_id"
end
