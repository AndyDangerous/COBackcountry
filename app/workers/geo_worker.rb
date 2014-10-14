class GeoWorker
  include Sidekiq::Worker

  def perform(ski_place_id)
    @ski_place = SkiPlace.find(ski_place_id)

    @ski_place.find_centroid()
    # @ski_place.find_avalanche_forecast_zone
    @ski_place.find_snotel
  end
end
