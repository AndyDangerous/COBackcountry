require_relative 'seed/fourteeners'
require_relative 'seed/test_ruby'

# load 'seed/co_avalanche_forecast_zones.json'

# fourteeners.each do |datum|
#   feature = RGeo::GeoJSON.decode(datum)
#   SkiPlace.create(geometry: feature.geometry, name: feature['name'])
# end


avalanche_forecast_zones.each do |zone|
  feature = RGeo::GeoJSON.decode(zone, json_parser: :json)
  AvalancheForecastZone.create(the_geom: feature.geometry,
                              name: feature['name'],
                              zone_url: feature['zone_url'],
                              url: feature['url'])
end



# def update_params(columns)
#   thing = columns[:geometry].read
#   feature = RGeo::GeoJSON.decode(thing, json_parser: :json)
#   if feature.first.geometry
#     columns[:geometry] = feature.first.geometry
#   else
#     columns[:geometry] = feature.geometry
#   end
#   columns
# end
