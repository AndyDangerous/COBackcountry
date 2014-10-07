class SkiPlace < ActiveRecord::Base
  belongs_to :snotel_station
  belongs_to :avalanche_forecast_zone

  self.rgeo_factory_generator = RGeo::Geos.factory_generator

  # commented out because it takes too long during seeding
  # before_save :get_snotel
  # before_save :get_avalanche_forecast_zone

  # binding.pry
  private

  def get_avalanche_forecast_zone
    AvyZone.find(self)
  end

  def get_snotel
    SnotelFinder.find(self)
  end

end
#
#
# t.string   "name"
# t.text     "description"
# t.string   "snotel_token"
# t.string   "avalanche_forecast_zone"
# t.datetime "created_at"
# t.datetime "updated_at"
# t.spatial  "geometry",                limit: {:srid=>0, :type=>"geometry"}
# end
