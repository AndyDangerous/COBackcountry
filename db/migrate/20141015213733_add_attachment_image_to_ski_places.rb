class AddAttachmentImageToSkiPlaces < ActiveRecord::Migration
  def self.up
    change_table :ski_places do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :ski_places, :image
  end
end
