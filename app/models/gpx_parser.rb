class GpxParser

  def self.parse(file_thing)
    @name = file_thing.original_filename
    @gpx = file_thing.tempfile
    parse_file
  end

  def self.parse_file#(with_z, with_m)
    data = @gpx.read
    @file_mode = data =~ /trkpt/ ? "//trkpt" : (data =~ /wpt/ ? "//wpt" : "//rtept")

    geo_json = '{"type": "Feature", "geometry": {"type": "MultiLineString","coordinates": '
    Nokogiri.HTML(data).search(@file_mode).each do |tp|
      # z = z.inner_text.to_f if with_z && z = tp.at("ele")
      # m = m.inner_text if with_m && m = tp.at("time")
      # @points << GeoRuby::SimpleFeatures::Point.from_coordinates([tp["lon"].to_f, tp["lat"].to_f, z, m],4326,with_z, with_m)
      # binding.pry

      geo_json += '[' + "#{tp[:lon].to_f}" +", " + "#{tp[:lat].to_f}" + '], '
    end
    geo_json = geo_json[0..-3]


    geo_json += '}}'
    # close
    # @record_count = @points.length
    # self.envelope
    geo_json
  end
end
#
#
# {   "type": "Feature", "geometry": {"type": "MultiPolygon","coordinates": [[[[
#                             -106.9058733709786,
#                             39.95836981320546
#                         ],
#                         [
#                             -106.9161927682049,
#                             40.02678502163121
#                         ],
#                         [
#                             -106.5528931413548,
#                             40.83181829066384
#                         ],
#                         [
#                             -106.5291313773413,
#                             40.88333053698097
#                         ]]]]},
#         "properties":{
#             "name": "#{}",
#             "zone_url": "https://avalanche.state.co.us/pub_bc_avo.php?zone=0",
#             "url": "http://avalanche.state.co.us/forecasts/backcountry-avalanche/steamboat-flat-tops/"
#         }
#
# }
