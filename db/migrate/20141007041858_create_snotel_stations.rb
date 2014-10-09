class CreateSnotelStations < ActiveRecord::Migration
  def change
    create_table :snotel_stations do |t|
      t.point :the_geom, geographic: true
      t.integer :elevation
      t.text :name
      t.integer :timezone
      t.string :triplet
      t.string :wind

      t.timestamps
    end
  end
end
