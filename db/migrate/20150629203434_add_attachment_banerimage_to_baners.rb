class AddAttachmentBanerimageToBaners < ActiveRecord::Migration
  def self.up
    change_table :baners do |t|
      t.attachment :banerimage
    end
  end

  def self.down
    remove_attachment :baners, :banerimage
  end
end
