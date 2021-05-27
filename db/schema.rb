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

ActiveRecord::Schema.define(version: 2021_04_06_111138) do

  create_table "comments", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "micropost_id"
    t.bigint "record_id"
    t.bigint "review_id"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["micropost_id"], name: "index_comments_on_micropost_id"
    t.index ["record_id"], name: "index_comments_on_record_id"
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "micropost_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["micropost_id"], name: "index_likes_on_micropost_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "microposts", charset: "utf8", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "musics", charset: "utf8", force: :cascade do |t|
    t.string "artist_name"
    t.string "album_name"
    t.string "image_url"
    t.string "song_name"
    t.string "external_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "practiceds", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "music_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "artist_name"
    t.index ["music_id"], name: "index_practiceds_on_music_id"
    t.index ["user_id"], name: "index_practiceds_on_user_id"
  end

  create_table "practicings", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "music_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "song_name"
    t.string "artist_name"
    t.string "image_url"
    t.index ["music_id"], name: "index_practicings_on_music_id"
    t.index ["user_id"], name: "index_practicings_on_user_id"
  end

  create_table "record_likes", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_id"], name: "index_record_likes_on_record_id"
    t.index ["user_id"], name: "index_record_likes_on_user_id"
  end

  create_table "records", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "time"
    t.string "song_name"
    t.string "artist_name"
    t.string "body"
    t.integer "practicing_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "music_id"
    t.string "image_url"
    t.integer "time_minutes"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "relationships", charset: "utf8", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true
  end

  create_table "review_likes", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "review_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_review_likes_on_review_id"
    t.index ["user_id"], name: "index_review_likes_on_user_id"
  end

  create_table "reviews", charset: "utf8", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "music_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["music_id"], name: "index_reviews_on_music_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.text "profile_image_id"
    t.date "history_date"
    t.integer "history_date_status", limit: 1, default: 0, null: false
    t.date "birth_date"
    t.integer "birth_date_status", limit: 1, default: 0, null: false
    t.string "sex"
    t.integer "sex_status", limit: 1, default: 0, null: false
    t.string "add"
    t.integer "add_status", limit: 1, default: 0, null: false
    t.string "blood"
    t.integer "blood_status", limit: 1, default: 0, null: false
    t.string "introduction"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishes", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "music_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["music_id"], name: "index_wishes_on_music_id"
    t.index ["user_id"], name: "index_wishes_on_user_id"
  end

  add_foreign_key "comments", "microposts"
  add_foreign_key "comments", "records"
  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "microposts"
  add_foreign_key "likes", "users"
  add_foreign_key "microposts", "users"
  add_foreign_key "practiceds", "musics"
  add_foreign_key "practiceds", "users"
  add_foreign_key "practicings", "musics"
  add_foreign_key "practicings", "users"
  add_foreign_key "record_likes", "records"
  add_foreign_key "record_likes", "users"
  add_foreign_key "records", "users"
  add_foreign_key "review_likes", "reviews"
  add_foreign_key "review_likes", "users"
  add_foreign_key "reviews", "musics"
  add_foreign_key "reviews", "users"
  add_foreign_key "wishes", "musics"
  add_foreign_key "wishes", "users"
end
