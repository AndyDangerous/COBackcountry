class SkiPlace < ActiveRecord::Base
  belongs_to :snotel_station
  belongs_to :avalanche_forecast_zone

  self.rgeo_factory_generator = RGeo::Geos.factory_generator

  before_save :load_up

  def load_up
    # background job:
    find_centroid
    find_avy_zone
    find_snotel
  end

  def find_centroid
    SkiPlaceGeo.find_centroid(self)
  end

  def find_avy_zone
    SkiPlaceGeo.find_avalanche_forecast_zone(self)
  end

  def find_snotel
    SkiPlaceGeo.find_snotel(self)
  end


end
