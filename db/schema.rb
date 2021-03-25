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

ActiveRecord::Schema.define(version: 2021_03_25_035737) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "micropost_id"
    t.integer "record_id"
    t.integer "review_id"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["micropost_id"], name: "index_comments_on_micropost_id"
    t.index ["record_id"], name: "index_comments_on_record_id"
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "micropost_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["micropost_id"], name: "index_likes_on_micropost_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.text "body"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "musics", force: :cascade do |t|
    t.string "artist_name"
    t.string "album_name"
    t.string "image_url"
    t.string "song_name"
    t.string "external_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "practiceds", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "music_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "artist_name"
    t.index ["music_id"], name: "index_practiceds_on_music_id"
    t.index ["user_id"], name: "index_practiceds_on_user_id"
  end

  create_table "practicings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "music_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "song_name"
    t.string "artist_name"
    t.string "image_url"
    t.index ["music_id"], name: "index_practicings_on_music_id"
    t.index ["user_id"], name: "index_practicings_on_user_id"
  end

  create_table "record_likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_id"], name: "index_record_likes_on_record_id"
    t.index ["user_id"], name: "index_record_likes_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "time"
    t.string "song_name"
    t.string "artist_name"
    t.string "body"
    t.integer "practicing_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "music_id"
    t.string "image_url"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true
  end

  create_table "review_likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "review_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_review_likes_on_review_id"
    t.index ["user_id"], name: "index_review_likes_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "music_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["music_id"], name: "index_reviews_on_music_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "music_id", null: false
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
