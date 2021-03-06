# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091123074128) do

  create_table "appearances", :force => true do |t|
    t.integer "person_id",  :default => 0, :null => false
    t.integer "episode_id", :default => 0, :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "episode_id", :default => 0, :null => false
    t.string   "author"
    t.string   "email"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "episodes", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  add_index "episodes", ["permalink"], :name => "index_episodes_on_permalink"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  add_index "pages", ["permalink"], :name => "index_pages_on_permalink"

  create_table "people", :force => true do |t|
    t.string  "name"
    t.text    "profile"
    t.string  "image_url"
    t.integer "image_height"
    t.integer "image_width"
    t.string  "permalink"
  end

  add_index "people", ["permalink"], :name => "index_people_on_permalink"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.string   "sluggable_type"
    t.integer  "sluggable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slugs", ["name", "sluggable_type"], :name => "index_slugs_on_name_and_sluggable_type", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

end
