class AddAvalancheForecastZones < ActiveRecord::Migration
  def change
    create_table :avalanche_forecast_zones do |t|
      t.multi_polygon :the_geom
      t.string :name
      t.string :zone_url
      t.string :url
    end
  end
end
