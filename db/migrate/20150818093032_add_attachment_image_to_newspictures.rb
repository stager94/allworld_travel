class AddAttachmentImageToNewspictures < ActiveRecord::Migration
  def self.up
    change_table :newspictures do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :newspictures, :image
  end
end
