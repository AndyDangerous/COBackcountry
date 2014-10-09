class SnotelStationsController < ApplicationController
  respond_to :json

  def index
    factory = RGeo::GeoJSON::EntityFactory.instance
    @stations = SnotelStation.all

    @stations.each do |station|
      @station = RGeo::GeoJSON.encode(factory.feature(@station.the_geom, nil,
                          {name:      @station.name,
                           timezone:  @station.timezone,
                           elevation: @station.elevation,
                           wind:      @station.wind,
                           triplet:   @station.triplet}))
      respond_with @stations
    end
  end

  def show
    factory = RGeo::GeoJSON::EntityFactory.instance
    @station = SnotelStation.find(params[:id])
    @station = RGeo::GeoJSON.encode(factory.feature(@station.the_geom, nil,
                        {name:      @station.name,
                         timezone:  @station.timezone,
                         elevation: @station.elevation,
                         wind:      @station.wind,
                         triplet:   @station.triplet}))
    respond_with @station
  end
end
