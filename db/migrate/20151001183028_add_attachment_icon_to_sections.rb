class AddAttachmentIconToSections < ActiveRecord::Migration
  def self.up
    change_table :sections do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :sections, :icon
  end
end
