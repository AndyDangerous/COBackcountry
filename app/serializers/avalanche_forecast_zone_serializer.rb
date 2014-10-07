class AvalancheForecastZoneSerializer < ActiveModel::Serializer
  attributes :type, :geometry, :properties

  RGeo::GeoJSON.encode(factory.feature(object.the_geom, nil,
                      {name:     object.name,
                       zone_url: object.zone_url,
                       url:      object.url}))
end
