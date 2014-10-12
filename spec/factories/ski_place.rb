FactoryGirl.define do
  factory :ski_place do
    name "Elevator Shaft"
    description "The Elevator Shaft is a couloir on Hellet Peak in Rocky Mountain National Park."
    snotel_station_id 1
    avalanche_forecast_zone_id 1
    geometry "POINT (-105.604107722 40.2477081249)"
  end
end

#   def feature
#   thing =  RGeo::GeoJSON.decode({"type"=>"Feature","geometry"=>{"type"=>"Point","coordinates"=>[-105.604107722,40.2477081249]},"properties"=>{"name"=>"Longs Peak"}})
#   binding.pry
#   thing.geometry
#   end
# end
#
#
# feature = RGeo::GeoJSON.decode({"type"=>"Feature","geometry"=>{"type"=>"Point","coordinates"=>[-105.604107722,40.2477081249]},"properties"=>{"name"=>"Longs Peak"}})
# SkiPlace.set_rgeo_factory_for_column(:geometry, RGeo::Geographic.spherical_factory(srid: 4326))
# SkiPlace.create(geometry: feature.geometry, name: feature['name'])
