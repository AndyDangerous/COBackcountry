class CreateSkiLines < ActiveRecord::Migration
  def change
    create_table :ski_lines do |t|
      t.string :name
      t.point :latlon, geographic: true
      t.text :description

      t.timestamps
    end
  end
end
