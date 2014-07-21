# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140720001321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "facebook_education_concentrations", force: true do |t|
    t.integer  "facebook_education_id"
    t.integer  "concentration_fid"
    t.string   "concentration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facebook_education_concentrations", ["facebook_education_id"], name: "fb_ed_con_on_fb_ed_id", using: :btree

  create_table "facebook_educations", force: true do |t|
    t.integer  "user_id"
    t.integer  "school_uid"
    t.string   "school"
    t.integer  "year"
    t.string   "concentration"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facebook_educations", ["user_id"], name: "index_facebook_educations_on_user_id", using: :btree

  create_table "facebook_extras", force: true do |t|
    t.integer  "user_id"
    t.date     "birthday"
    t.string   "gender"
    t.integer  "hometown_fid"
    t.string   "hometown"
    t.string   "hometown_city"
    t.string   "hometown_region"
    t.string   "hometown_country"
    t.string   "link"
    t.string   "locale"
    t.string   "timezone"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facebook_extras", ["user_id"], name: "index_facebook_extras_on_user_id", using: :btree

  create_table "facebook_infos", force: true do |t|
    t.integer  "user_id"
    t.string   "nickname"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "url"
    t.string   "location"
    t.boolean  "verified"
    t.string   "city"
    t.string   "region"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facebook_infos", ["user_id"], name: "index_facebook_infos_on_user_id", using: :btree

  create_table "facebook_works", force: true do |t|
    t.integer  "user_id"
    t.integer  "employer_fid"
    t.string   "employer"
    t.integer  "location_fid"
    t.string   "location"
    t.string   "location_city"
    t.string   "location_region"
    t.string   "location_country"
    t.integer  "position_fid"
    t.string   "positiion"
    t.integer  "from_fid"
    t.string   "from_name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facebook_works", ["user_id"], name: "index_facebook_works_on_user_id", using: :btree

  create_table "hstores", force: true do |t|
    t.hstore "fbdata"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.integer  "token_expires_at"
    t.text     "auth_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
