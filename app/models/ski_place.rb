class SkiPlace < ActiveRecord::Base
  validates :name,
            :description, presence: true

  belongs_to :snotel_station
  belongs_to :avalanche_forecast_zone

  self.rgeo_factory_generator = RGeo::Geos.factory_generator
  SkiPlace.set_rgeo_factory_for_column(:geometry, RGeo::Geographic.spherical_factory(srid: 4326))

  # after_create :load_up

  def self.create(data)
    sp = super
    sp.load_up
  end

  # def self.create_and_load(data)
  #   sp = create(data)
  #   sp.load_up
  # end

  def load_up
    # background job:
    find_centroid
    find_avy_zone
    find_snotel
  end

  def find_centroid
    self.centroid = SkiPlaceGeo.find_centroid(self)
    self.save
  end

  def find_avy_zone
    self.avalanche_forecast_zone_id = SkiPlaceGeo.find_avalanche_forecast_zone(self)
    self.save
  end

  def find_snotel
    self.snotel_station_id = SkiPlaceGeo.find_snotel(self)
    self.save
  end


end
