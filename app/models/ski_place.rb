class SkiPlace < ActiveRecord::Base
  belongs_to :snotel_station
  belongs_to :avalanche_forecast_zone

  self.rgeo_factory_generator = RGeo::Geos.factory_generator


    # Pull this out into module or PORO
    # SnotelStation.retrieve(self.token)

  # background job:
  # find centroid
  # find_avalanch_forecast zone
  # find snotel
end
