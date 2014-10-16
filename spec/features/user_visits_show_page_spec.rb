require 'rails_helper'

describe "when a user visits a ski_place show page" do
  context "as a guest" do

    before(:each) do
      @ski_place = create(:ski_place)
      @snotel_station = create(:snotel_station)
      @avalanche_forecast_zone = create(:avalanche_forecast_zone)

      visit ski_place_path(@ski_place)
    end

    it "should exist" do
      expect(page.status_code).to eq 200
    end

    it "should see the details of the ski place" do
      expect(current_path).to eq(ski_place_path(@ski_place))
      expect(page).to have_content @ski_place.name
      expect(page).to have_content @ski_place.description
    end

    it "should have information about current avalanche forecast for the zone" do
      expect(page).to have_content @ski_place.avalanche_forecast_zone.name
      expect(page).to have_link @ski_place.avalanche_forecast_zone.name
    end

    it "should have latest snotel information" do
      daily = [{:date=>"2014-10-15", :snow_water_equivalent_in=>"0.3", :change_in_snow_water_equivalent_in=>"0.1", :snow_depth_in=>"1", :change_in_snow_depth_in=>"-2"}]
      allow(Snotel).to receive(:daily).and_return(daily)

      expect(page).to have_content @ski_place.snotel_station.name
      expect(page).to have_content "0.3"
    end
  end
end
