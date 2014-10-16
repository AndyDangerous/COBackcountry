require 'rails_helper'

RSpec.describe SnotelStation, :type => :model do

  let(:snotel_station) do
    create(:snotel_station)
  end

  it "is valid" do
    expect(snotel_station).to be_valid
  end

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:triplet) }

  it { should validate_presence_of(:wind) }

  it { should validate_presence_of(:elevation) }

  it { should validate_presence_of(:timezone) }

  context "retreiving snotel data" do
    let(:daily) do
      [{:date=>"2014-10-15", :snow_water_equivalent_in=>"0.3", :change_in_snow_water_equivalent_in=>"0.1", :snow_depth_in=>"1", :change_in_snow_depth_in=>"-2"}]
    end

    let(:snotel_station) do
      create(:snotel_station)
    end


    it "can find its token" do
      token = snotel_station.token
      expect(token).to eq(:jackwhacker_gulch)
    end

    it "can retrieve daily snotel data for a site" do
      allow(Snotel).to receive(:daily).and_return(daily)
      sno_data = snotel_station.daily.first

      expect(sno_data[:snow_water_equivalent_in]).to           eq("0.3")
      expect(sno_data[:change_in_snow_water_equivalent_in]).to eq("0.1")
      expect(sno_data[:snow_depth_in]).to                      eq("1")
      expect(sno_data[:change_in_snow_depth_in]).to            eq("-2")
    end

    it "does not return erroneous data" do
      allow(Snotel).to receive(:daily).and_return(daily)
      sno_data = snotel_station.daily.first

      expect(sno_data[:snow_water_equivalent_in]).to_not           eq(0.3)
      expect(sno_data[:change_in_snow_water_equivalent_in]).to_not eq(-1)
      expect(sno_data[:snow_depth_in]).to_not                      eq("1.0")
      expect(sno_data[:change_in_snow_depth_in]).to_not            eq("2")
    end
  end
end
