class Api::V1::SnotelStationsController < ApplicationController
  respond_to :json

  def index
    stations = SnotelStation.all
    collection = []

    stations.each do |station|
      collection << encode(station)
    end
    respond_with collection
  end

  def show
    factory = RGeo::GeoJSON::EntityFactory.instance
    station = SnotelStation.find(params[:id])
    station = encode(station)
    respond_with station
  end

  def encode(station)
    factory = RGeo::GeoJSON::EntityFactory.instance
    station = RGeo::GeoJSON.encode(factory.feature(station.the_geom, nil,
                        {name:      station.name,
                         timezone:  station.timezone,
                         elevation: station.elevation,
                         wind:      station.wind,
                         triplet:   station.triplet}))
  end
end
