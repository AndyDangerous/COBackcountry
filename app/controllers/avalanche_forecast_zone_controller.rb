class AvalancheForecastZoneController < ApplicationController
  respond_to :json

  def index
    @zonez = AvalancheForecastZone.all
    factory = RGeo::GeoJSON::EntityFactory.instance
    @zonez = RGeo::GeoJSON.encode(factory.feature(@ski_place.geometry, nil, {name: "#{@ski_place.name}", id: "#{@ski_place.id}"}))
    # respond_with @zonez
    respond_to do |format|
      format.json { render json: @zonez }
    end
  end
end



def show
  @ski_place = SkiPlace.find(params[:id])
  factory = RGeo::GeoJSON::EntityFactory.instance
  gon.ski_place = RGeo::GeoJSON.encode(factory.feature(@ski_place.geometry, nil, {name: "#{@ski_place.name}", id: "#{@ski_place.id}"}))
end
