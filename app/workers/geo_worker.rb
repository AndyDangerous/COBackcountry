class GeoWorker
  include Sidekiq::Worker

  def perform(ski_place_id)
    @ski_place = SkiPlace.find(ski_place_id)
    load_up
  end

  def load_up
    ski_place.find_centroid
    ski_place.find_avy_zone
    ski_place.find_snotel
  end
end
