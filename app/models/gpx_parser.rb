class GpxParser

  def self.parse(file_thing)
    # @name = file_thing.original_filename
    parse_file(file_thing.tempfile)
  end

  def self.parse_file(gpx)
    data = gpx.read
    @file_mode = data =~ /trkpt/ ? "//trkpt" : (data =~ /rtept/ ? "//rtept" : "//wpt")

    geo_json = '{"type": "Feature", "geometry": {"type": "MultiLineString","coordinates": [['
    Nokogiri.HTML(data).search(@file_mode).each do |tp|
      geo_json += '[' + "#{tp[:lon].to_f}" +", " + "#{tp[:lat].to_f}" + '], '
    end
    geo_json = geo_json[0..-3]
    geo_json += ']]}}'
    geo_json
  end
end
