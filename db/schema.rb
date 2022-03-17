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

ActiveRecord::Schema[7.0].define(version: 2022_03_17_112927) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blogs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "header"
    t.string "title"
    t.string "headline"
    t.string "subtext"
    t.string "sub_headline"
    t.string "body"
    t.string "paragraph1"
    t.string "code1"
    t.string "paragraph2"
    t.string "code2"
    t.string "paragraph3"
    t.string "code3"
    t.string "paragraph4"
    t.string "code4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_blog_id", null: false
    t.string "text"
    t.boolean "is_liked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_blog_id"], name: "index_comments_on_user_blog_id"
  end

  create_table "user_blogs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "blog_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_user_blogs_on_blog_id"
    t.index ["user_id"], name: "index_user_blogs_on_user_id"
  end

  create_table "user_comments", force: :cascade do |t|
    t.bigint "user_blog_id", null: false
    t.bigint "comment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_user_comments_on_comment_id"
    t.index ["user_blog_id"], name: "index_user_comments_on_user_blog_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "password_digest"
    t.string "password_secure"
    t.string "password_confirmation"
    t.string "full_name"
    t.string "phone_number"
    t.string "email"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blogs", "users"
  add_foreign_key "comments", "user_blogs"
  add_foreign_key "user_blogs", "blogs"
  add_foreign_key "user_blogs", "users"
  add_foreign_key "user_comments", "comments"
  add_foreign_key "user_comments", "user_blogs"
end
