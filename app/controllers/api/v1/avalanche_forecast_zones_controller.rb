class Api::V1::AvalancheForecastZonesController < ApplicationController
  respond_to :json

  def index
    zones = AvalancheForecastZone.all
    collection = []

    zones.each do |zone|
      collection << encode(zone)
    end
    respond_with collection
  end

  def show
    zone = AvalancheForecastZone.find(params[:id])
    zone = encode(zone)
    respond_with zone
  end

  def encode(zone)
    factory = RGeo::GeoJSON::EntityFactory.instance
    zone = RGeo::GeoJSON.encode(factory.feature(zone.the_geom, nil,
                        {name:      zone.name,
                         timezone:  zone.zone_url,
                         elevation: zone.url}))
  end
end
