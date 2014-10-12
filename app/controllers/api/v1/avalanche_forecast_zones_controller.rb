class Api::V1::AvalancheForecastZonesController < ApplicationController
  respond_to :json

  def index
    factory = RGeo::GeoJSON::EntityFactory.instance
    @zones = AvalancheForecastZone.all
    collection = []

    @zones.each do |zone|
      collection << RGeo::GeoJSON.encode(factory.feature(zone.the_geom, nil,
                          {name:      zone.name,
                           timezone:  zone.zone_url,
                           elevation: zone.url}))
    end
    respond_with collection
  end

  def show
    factory = RGeo::GeoJSON::EntityFactory.instance
    @zone = AvalancheForecastZone.find(params[:id])
    @zone = RGeo::GeoJSON.encode(factory.feature(@zone.the_geom, nil,
                        {name:      @zone.name,
                         timezone:  @zone.zone_url,
                         elevation: @zone.url}))
    respond_with @zone
  end
end
