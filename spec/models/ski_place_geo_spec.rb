require 'rails_helper'

RSpec.describe SkiPlaceGeo, type: :model do

  let(:ski_place) do
    file = File.read('geodata/COBackcountry_routes/sfb.json')
    @the_geom = RGeo::GeoJSON.decode(file, json_parser: :json)
    create(:ski_place, geometry: @the_geom.first.geometry)
  end

  it 'finds the centroid of a geometry' do
    #the actual centroid should be checked to make sure it makes sense
    expect(ski_place.centroid).to eq nil
    centroid = SkiPlaceGeo.find_centroid(ski_place)
    expect(ski_place.centroid).not_to eq nil
  end

  xit "finds the avalanche forecast zone for a ski place" do
    # needs seed data in order to really test
    SkiPlaceGeo.find_centroid(ski_place)
    ski_place.avalanche_forecast_zone_id = nil
    # SkiPlaceGeo.find_avalanche_forecast_zone(ski_place)

    expect(ski_place.avalanche_forecast_zone_id).to eq 1
  end

  xit 'finds a snotel station for a ski place' do
    # needs seed data in order to really test
    SkiPlaceGeo.find_centroid(ski_place)
    ski_place.snotel_station_id = nil
    SkiPlaceGeo.find_snotel(ski_place)
    expect(ski_place.snotel_station_id).to eq 1
  end
end
