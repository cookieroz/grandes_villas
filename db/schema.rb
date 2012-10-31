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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121031010839) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categorizations", :force => true do |t|
    t.integer  "category_id"
    t.integer  "villa_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "comments", :force => true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "villa_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["villa_id"], :name => "index_comments_on_villa_id"

  create_table "costa_tropicals", :force => true do |t|
    t.string   "title"
    t.string   "category"
    t.string   "ct_image"
    t.string   "city"
    t.string   "activity"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "place"
    t.integer  "villa_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "locations", ["villa_id"], :name => "index_locations_on_villa_id"

  create_table "photos", :force => true do |t|
    t.string   "caption"
    t.integer  "villa_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
  end

  create_table "rates", :force => true do |t|
    t.string   "price_info"
    t.string   "price"
    t.integer  "villa_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rates", ["villa_id"], :name => "index_rates_on_villa_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "villa_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["villa_id"], :name => "index_tags_on_villa_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "villalocations", :force => true do |t|
    t.integer  "location_id"
    t.integer  "villa_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "villas", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "address"
    t.text     "observations"
    t.integer  "sleeps",       :default => 4
    t.integer  "bedrooms",     :default => 2
  end

end
