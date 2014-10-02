class SkiPlacesController < ApplicationController
  def index

  end

  def show
    @ski_place = SkiPlace.find(params[:id])

    factory = RGeo::GeoJSON::EntityFactory.instance

    gon.ski_place = RGeo::GeoJSON.encode(factory.feature(@ski_place.geometry, nil, {name: "#{@ski_place.name}", id: "#{@ski_place.id}"}))

  end
end
