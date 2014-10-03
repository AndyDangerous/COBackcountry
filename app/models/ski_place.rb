class SkiPlace < ActiveRecord::Base
  self.rgeo_factory_generator = RGeo::Geos.factory_generator
  set_rgeo_factory_for_column(:geometry, RGeo::Geographic.spherical_factory(srid: 4326))


  def snotel
    Snotel.daily(:berthoud_summit)
    # Pull this out into module or PORO
    # SnotelStation.retrieve(self.token)
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
