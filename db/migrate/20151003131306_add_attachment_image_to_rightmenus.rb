class AddAttachmentImageToRightmenus < ActiveRecord::Migration
  def self.up
    change_table :rightmenus do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :rightmenus, :image
  end
end
