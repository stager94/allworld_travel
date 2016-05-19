class AddAttachmentImageToPlacetextblocks < ActiveRecord::Migration
  def self.up
    change_table :placetextblocks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :placetextblocks, :image
  end
end
