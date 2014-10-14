class SkiPlace < ActiveRecord::Base
  validates :name,
            :description, presence: true

  belongs_to :snotel_station
  belongs_to :avalanche_forecast_zone

  self.rgeo_factory_generator = RGeo::Geos.factory_generator
  SkiPlace.set_rgeo_factory_for_column(:geometry, RGeo::Geographic.spherical_factory(srid: 4326))

  after_create :load_up

  def load_up
    # GeoWorker.perform_async(self.id)
    
    GeoWorker.new.perform(self.id)
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
