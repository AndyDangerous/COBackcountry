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

ActiveRecord::Schema.define(version: 20141007041858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "avalanche_forecast_zones", force: true do |t|
    t.string  "name"
    t.string  "zone_url"
    t.string  "url"
    t.spatial "the_geom", limit: {:srid=>0, :type=>"multi_polygon"}
  end

  create_table "ski_places", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "snotel_token"
    t.string   "avalanche_forecast_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "geometry",                limit: {:srid=>0, :type=>"geometry"}
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

end
