class StaticPagesController < ApplicationController
  def index
    locations = SkiLine.all

    factory = RGeo::GeoJSON::EntityFactory.instance

    gon.mountains = locations.map do |location|
      RGeo::GeoJSON.encode(factory.feature(location.latlon, nil, {name: "#{location.name}", id: "#{location.id}"}))
    end
  end
end