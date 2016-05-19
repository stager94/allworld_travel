class AddAttachmentGlobusToCountries < ActiveRecord::Migration
  def self.up
    change_table :countries do |t|
      t.attachment :globus
    end
  end

  def self.down
    remove_attachment :countries, :globus
  end
end
