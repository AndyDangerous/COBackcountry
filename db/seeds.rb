require_relative './seed/fourteeners'
# binding.pry
@fourteeners.each do |datum|
  feature = RGeo::GeoJSON.decode(datum)
  SkiPlace.set_rgeo_factory_for_column(:geometry, RGeo::Geographic.spherical_factory(srid: 4326))
  SkiPlace.create(geometry: feature.geometry, name: feature['name'])
end

avy_zones = File.read("#{Rails.root.to_s}/db/seed/co_avalanche_forecast_zones.json")
feature_collection = RGeo::GeoJSON.decode(avy_zones, json_parser: :json)
feature_collection.each do |feature|
  # features = RGeo::GeoJSON.decode(zone, json_parser: :json)
  # AvalancheForecastZone.set_rgeo_factory_for_column(:the_geom, RGeo::Geographic.spherical_factory(srid: 4326))
  AvalancheForecastZone.create(the_geom: feature.geometry,
                              name: feature['name'],
                              zone_url: feature['zone_url'],
                              url: feature['url'])
end
