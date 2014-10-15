class SkiPlace < ActiveRecord::Base
  validates :name,
            :description, presence: true

  belongs_to :snotel_station
  belongs_to :avalanche_forecast_zone

  self.rgeo_factory_generator = RGeo::Geos.factory_generator
  self.set_rgeo_factory_for_column(:geometry, RGeo::Geographic.spherical_factory(srid: 4326))

  after_create :load_up

  def load_up
    GeoWorker.perform_async(self.id)
  end

  # def load_up
  #   # background job:
  #   find_centroid
  #   find_avy_zone
  #   find_snotel
  # end

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
