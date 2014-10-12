class Api::V1::SkiPlacesController < ApplicationController
  respond_to :json

  def index
    factory = RGeo::GeoJSON::EntityFactory.instance
    ski_places = SkiPlace.all
    this_is_bullshit = []

    # it is dumb that you can't shovel into feature collections
    ski_places.each do |ski_place|
      this_is_bullshit << RGeo::GeoJSON.encode(factory.feature(ski_place.geometry, nil, {name: "#{ski_place.name}", id: "#{ski_place.id}"}))
    end

    ski_place_collection = factory.feature_collection(this_is_bullshit)

    respond_with this_is_bullshit
  end

  def show
    @ski_place = SkiPlace.find(params[:id])
    factory = RGeo::GeoJSON::EntityFactory.instance
    ski_place = RGeo::GeoJSON.encode(factory.feature(@ski_place.geometry, nil, {name: "#{@ski_place.name}", id: "#{@ski_place.id}"}))
    respond_with ski_place
  end
end
