class SkiPlaceGeo
  def self.find_centroid(ski_place)
    SkiPlace.set_rgeo_factory_for_column(:centroid, RGeo::Geographic.spherical_factory(srid: 4326))
        geometry = ski_place.geometry

        query = "SELECT ST_AsText(ST_Centroid('#{geometry.as_text}'))"
        result = ActiveRecord::Base.connection.execute query

        ski_place.centroid = result[0]['st_astext']
        ski_place.save
  end

  def self.find_avalanche_forecast_zone(ski_place)
    centroid = ski_place.centroid
    zones = AvalancheForecastZone.all

    facts = zones.map do |zone|
      zone.the_geom.intersects?(centroid)
    end
    ski_place.avalanche_forecast_zone_id = facts.find_index(true) + 1
    ski_place.save
  end

  def self.find_snotel(ski_place)
    p = ski_place.centroid
    snotels = SnotelStation.all

    ski_place.snotel_station_id = snotels.sort_by do |station|
       station.the_geom.distance(p.geometry)
    end.first.id
    ski_place.save
  end
end
