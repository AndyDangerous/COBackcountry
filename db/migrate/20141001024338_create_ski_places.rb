class CreateSkiPlaces < ActiveRecord::Migration
  def change
    create_table :ski_places do |t|
      t.string :name
      t.geometry :geometry
      t.text :description
      t.string :snotel_token
      t.string :avalanche_forecast_zone

      t.timestamps
    end
  end
end
