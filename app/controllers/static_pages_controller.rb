class StaticPagesController < ApplicationController
  def index
    locations = SkiPlace.all

    factory = RGeo::GeoJSON::EntityFactory.instance

    gon.geometries = locations.map do |location|
      RGeo::GeoJSON.encode(factory.feature(location.geometry, nil, {name: "#{location.name}", id: "#{location.id}"}))
    end
    gon.geometry_url = "ski_places"
  end

  def about
  end

  def contact
  end
end
