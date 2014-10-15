<<<<<<< HEAD
class GeoWorker
  include Sidekiq::Worker

  def perform(ski_place_id)
    @ski_place = SkiPlace.find(ski_place_id)

    @ski_place.find_centroid()
    @ski_place.find_avalanche_forecast_zone
    @ski_place.find_snotel
  end
end
||||||| merged common ancestors
=======
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
>>>>>>> 58c15ea456171375f3e5e60410c2e1693e7e58d5
