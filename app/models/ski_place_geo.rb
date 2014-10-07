class SkiPlaceGeo
  def self.find_centroid(ski_place)
    SkiPlace.set_rgeo_factory_for_column(:centroid, RGeo::Geographic.spherical_factory(srid: 4326))
    geometry = ski_place.geometry

    query = "SELECT ST_AsText(ST_Centroid('#{geometry.as_text}'))" # probably this isn't the right way to query
    result = ActiveRecord::Base.connection.execute query

    ski_place.centroid = result[0]['st_astext']
    ski_place.save
  end

  def self.find_avalanche_forecast_zone(ski_place)
    point = ski_place.centroid
    polygons = AvalancheForecastZone.all

    array = []

    polygons.each do |polygon|
      query = "SELECT ST_Within(ST_GeomFromText('#{point.as_text}'),ST_GeomFromText('#{polygon.the_geom.as_text}'))" # probably this isn't the right way to query
      result = ActiveRecord::Base.connection.execute query
      array << result[0].values.first
    end

    ski_place.avalanche_forecast_zone_id = array.find_index("t") + 1
    ski_place.save
  end

  def self.find_snotel(ski_place)

  end

end
