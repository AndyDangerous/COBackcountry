require 'rails_helper'

RSpec.describe SnotelFinder, type: :poro do

  file = File.read('geodata/COBackcountry_routes/power_of_four.json')
  @the_geom = RGeo::GeoJSON.decode(file, json_parser: :json)

  it 'finds the centroid of a geometry' do
    snotel_finder = SnotelFinder.new(@the_geom)
    centroid = snotel_finder.centroid

  end

  # let(:ski_place) do
  #   build(:ski_place, geometry: the_geom.geometry)
  # end

end
#
#
# data.each do |datum|
#   feature = RGeo::GeoJSON.decode(datum)
#   SkiPlace.create(geometry: feature.geometry, name: feature['name'])
# end
