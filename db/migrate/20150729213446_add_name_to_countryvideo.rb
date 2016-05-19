class AddNameToCountryvideo < ActiveRecord::Migration
  def change
    add_column :countryvideos, :name, :string
  end
end
