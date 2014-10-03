class SkiPlace < ActiveRecord::Base

  self.rgeo_factory_generator = RGeo::Geos.factory_generator

  before_save :get_snotel

  # binding.pry
  private


  def get_snotel
    puts SnotelFinder.centroid(self)
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
