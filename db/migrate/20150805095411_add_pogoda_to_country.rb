class AddPogodaToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :pogoda, :text
  end
end
