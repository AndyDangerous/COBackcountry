
query = "SELECT ST_AsText(ST_Centroid('#{zone.the_geom.as_text}'))" # probably this isn't the right way to query
result = ActiveRecord::Base.connection.execute query
result[0]['st_astext']



# search rails api for escaping
zone   = AvalancheForecastZone.last
query  = "SELECT ST_AsText(ST_Centroid(?))"
result = ActiveRecord::Base.connection.execute [query, zone.the_geom.as_text]
result[0]['st_astext']
# => "POINT(-105.30886210409 37.572272203746)"
