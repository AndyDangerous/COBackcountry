class CreateSkiPlaces < ActiveRecord::Migration
  def change
    create_table :ski_places do |t|
      t.string :name
      t.geometry :geometry, geographic: true
      t.point :centroid, geographic: true
      t.text :description
      t.string :snotel_station_id
      t.string :avalanche_forecast_zone_id

      t.timestamps
    end
  end
end
