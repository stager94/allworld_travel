class AddAttachmentHomeinfografikToAllsettings < ActiveRecord::Migration
  def self.up
    change_table :allsettings do |t|
      t.attachment :homeinfografik
    end
  end

  def self.down
    remove_attachment :allsettings, :homeinfografik
  end
end
