require 'rails_helper'

RSpec.describe SnotelStation, :type => :model do
  xit "can retrieve daily snotel data for a site" do
    berthoud = SnotelStation.retrieve(:berthoud_summit)
    binding.pry
  end
end
