require 'rails_helper'
# include ActionDispatch::TestProcess

RSpec.describe GpxParser, type: :model do

  describe "Should save a gpx track" do
    let(:file) do
      extend ActionDispatch::TestProcess
      fixture_file_upload('/files/sfb.gpx', 'text/xml')
    end

    it "parses a GPX file" do
      class << file
        attr_accessor :tempfile
      end

      parsed = JSON.parse(GpxParser.parse(file))

      expect(parsed["type"]).to eq("Feature")
      expect(parsed["geometry"]["type"]).to eq("MultiLineString")
    end
  end



  # it "can upload a gpx file" do
  #   file = fixture_file_upload('/files/sfb.gpx', 'text/xml')
  #   post :uploadLicense, :upload => @file
  #   response.should be_success
  # end
  #
  # xit "denies a non-gpx file" do
  # end
end
