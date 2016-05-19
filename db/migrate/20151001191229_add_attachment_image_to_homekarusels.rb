class AddAttachmentImageToHomekarusels < ActiveRecord::Migration
  def self.up
    change_table :homekarusels do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :homekarusels, :image
  end
end
