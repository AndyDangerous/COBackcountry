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

ActiveRecord::Schema.define(version: 20141015213733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "avalanche_forecast_zones", force: true do |t|
    t.spatial "the_geom", limit: {:srid=>4326, :type=>"multi_polygon", :geographic=>true}
    t.string  "name"
    t.string  "zone_url"
    t.string  "url"
  end

  create_table "ski_places", force: true do |t|
    t.string   "name"
    t.spatial  "geometry",                   limit: {:srid=>4326, :type=>"geometry", :geographic=>true}
    t.spatial  "centroid",                   limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.text     "description"
    t.string   "snotel_station_id"
    t.string   "avalanche_forecast_zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "snotel_stations", force: true do |t|
    t.spatial  "the_geom",   limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.integer  "elevation"
    t.text     "name"
    t.integer  "timezone"
    t.string   "triplet"
    t.string   "wind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
