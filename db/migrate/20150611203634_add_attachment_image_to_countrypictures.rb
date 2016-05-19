class AddAttachmentImageToCountrypictures < ActiveRecord::Migration
  def self.up
    change_table :countrypictures do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :countrypictures, :image
  end
end
