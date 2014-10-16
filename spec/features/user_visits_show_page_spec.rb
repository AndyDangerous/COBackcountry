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
      expect(page).to have_content @ski_place.snotel_station.name
    end
  end
end
