class AddAvalancheForecastZone < ActiveRecord::Migration
  def change
    create_table :ski_places_avalanche_forecast_zone do |t|
      t.geometry :geometry
      t.text :description
      t.string :snotel_token
      t.string :avalanche_forecast_zone
    end
  end
end
