class SnotelStationSerializer < ActiveModel::Serializer
  attributes :type, :geometry, :properties

  RGeo::GeoJSON.encode(factory.feature(object.the_geom, nil,
                      {name:      object.name,
                       timezone:  object.timezone,
                       elevation: object.elevation,
                       wind:      object.wind,
                       triplet:   object.triplet}))
end
