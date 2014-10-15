class SkiPlace < ActiveRecord::Base
  validates :name,
            :description, presence: true

  belongs_to :snotel_station
  belongs_to :avalanche_forecast_zone

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                    default_url: "http://s3-us-west-1.amazonaws.com/cobackcountry/DSCF3415.jpg",
                   	s3_credentials: { :access_key_id => ENV['S3_KEY'],
															  			:secret_access_key => ENV['S3_SECRET']},
										bucket: ENV['AWS_BUCKET']
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  self.rgeo_factory_generator = RGeo::Geos.factory_generator
  self.set_rgeo_factory_for_column(:geometry, RGeo::Geographic.spherical_factory(srid: 4326))

  after_create :load_up

  def load_up
    GeoWorker.perform_async(self.id)
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
