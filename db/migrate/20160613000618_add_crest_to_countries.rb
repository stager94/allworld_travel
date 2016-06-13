class AddCrestToCountries < ActiveRecord::Migration
  def self.up
    change_table :countries do |t|
      t.attachment :crest
    end
  end

  def self.down
    remove_attachment :countries, :crest
  end
end
