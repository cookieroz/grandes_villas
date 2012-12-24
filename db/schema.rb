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

ActiveRecord::Schema.define(:version => 20121224050202) do

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

  create_table "category_translations", :force => true do |t|
    t.integer  "category_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "category_translations", ["category_id"], :name => "index_category_translations_on_category_id"
  add_index "category_translations", ["locale"], :name => "index_category_translations_on_locale"

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

  create_table "costa_tropical_translations", :force => true do |t|
    t.integer  "costa_tropical_id"
    t.string   "locale"
    t.string   "title"
    t.text     "content"
    t.string   "activity"
    t.string   "city"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "costa_tropical_translations", ["costa_tropical_id"], :name => "index_41b59f000277e188d731b32d2a79acc882816538"
  add_index "costa_tropical_translations", ["locale"], :name => "index_costa_tropical_translations_on_locale"

  create_table "costa_tropicals", :force => true do |t|
    t.string   "title"
    t.string   "category"
    t.string   "ct_image"
    t.string   "city"
    t.string   "activity"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "costa_tropicals", ["slug"], :name => "index_costa_tropicals_on_slug"

  create_table "destination_translations", :force => true do |t|
    t.integer  "destination_id"
    t.string   "locale"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "destination_translations", ["destination_id"], :name => "index_destination_translations_on_destination_id"
  add_index "destination_translations", ["locale"], :name => "index_destination_translations_on_locale"

  create_table "destinations", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "address"
    t.string   "dest_image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "destinations", ["slug"], :name => "index_destinations_on_slug"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

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
    t.string   "image"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "image_uid"
    t.string   "image_name"
    t.string   "path"
    t.string   "name"
    t.integer  "position"
    t.integer  "imageable_id"
    t.string   "imageable_type"
  end

  create_table "rate_translations", :force => true do |t|
    t.integer  "rate_id"
    t.string   "locale"
    t.string   "price_info"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rate_translations", ["locale"], :name => "index_rate_translations_on_locale"
  add_index "rate_translations", ["rate_id"], :name => "index_rate_translations_on_rate_id"

  create_table "rates", :force => true do |t|
    t.string   "price_info"
    t.string   "price"
    t.integer  "villa_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rates", ["villa_id"], :name => "index_rates_on_villa_id"

  create_table "reservations", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "villa_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "service_translations", :force => true do |t|
    t.integer  "service_id"
    t.string   "locale"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "service_translations", ["locale"], :name => "index_service_translations_on_locale"
  add_index "service_translations", ["service_id"], :name => "index_service_translations_on_service_id"

  create_table "services", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "services", ["slug"], :name => "index_services_on_slug"

  create_table "static_page_translations", :force => true do |t|
    t.integer  "static_page_id"
    t.string   "locale"
    t.text     "about_content"
    t.text     "home_content"
    t.text     "contact_content"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "static_page_translations", ["locale"], :name => "index_static_page_translations_on_locale"
  add_index "static_page_translations", ["static_page_id"], :name => "index_static_page_translations_on_static_page_id"

  create_table "static_pages", :force => true do |t|
    t.text     "about_content"
    t.text     "home_content"
    t.text     "contact_content"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "tag_translations", :force => true do |t|
    t.integer  "tag_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tag_translations", ["locale"], :name => "index_tag_translations_on_locale"
  add_index "tag_translations", ["tag_id"], :name => "index_tag_translations_on_tag_id"

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

  create_table "villa_translations", :force => true do |t|
    t.integer  "villa_id"
    t.string   "locale"
    t.text     "content"
    t.text     "observations"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "villa_translations", ["locale"], :name => "index_villa_translations_on_locale"
  add_index "villa_translations", ["villa_id"], :name => "index_villa_translations_on_villa_id"

  create_table "villalocations", :force => true do |t|
    t.integer  "location_id"
    t.integer  "villa_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "villas", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "address"
    t.text     "observations"
    t.integer  "sleeps",         :default => 4
    t.integer  "bedrooms",       :default => 2
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "slug"
    t.float    "bathroom"
    t.integer  "destination_id"
  end

  add_index "villas", ["slug"], :name => "index_villas_on_slug"

end
