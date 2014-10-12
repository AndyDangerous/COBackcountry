require 'rails_helper'

RSpec.describe SkiPlaceGeo, type: :model do

  file = File.read('geodata/COBackcountry_routes/power_of_four.json')
  @the_geom = RGeo::GeoJSON.decode(file, json_parser: :json)

  let(:ski_place) do
    build(:ski_place, geometry: @the_geom.geometry)
  end

  it 'finds the centroid of a geometry' do
    centroid = SkiPlaceGeo.find_centroid(ski_place)
    binding.pry
    centroid = snotel_finder.centroid

  end
end
