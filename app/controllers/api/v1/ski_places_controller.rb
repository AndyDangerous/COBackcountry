class Api::V1::SkiPlacesController < ApplicationController
  respond_to :json

  def index
    ski_places = SkiPlace.all
    this_is_bullshit = []

    # it is dumb that you can't shovel into feature collections
    ski_places.each do |ski_place|
      this_is_bullshit << encode(ski_place)
    end

    ski_place_collection = factory.feature_collection(this_is_bullshit)

    respond_with this_is_bullshit
  end

  def show
    ski_place = SkiPlace.find(params[:id])

    ski_place = encode(ski_place)
    respond_with ski_place
  end

  def encode(ski_place)
    factory = RGeo::GeoJSON::EntityFactory.instance
    RGeo::GeoJSON.encode(factory.feature(ski_place.geometry, nil, {name: "#{@ski_place.name}", id: "#{@ski_place.id}"}))
  end
end
