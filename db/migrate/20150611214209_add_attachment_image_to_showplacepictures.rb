class AddAttachmentImageToShowplacepictures < ActiveRecord::Migration
  def self.up
    change_table :showplacepictures do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :showplacepictures, :image
  end
end
