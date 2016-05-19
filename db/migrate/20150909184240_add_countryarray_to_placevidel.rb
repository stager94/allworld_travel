class AddCountryarrayToPlacevidel < ActiveRecord::Migration
  def change
    add_column :placevidels, :countryarray, :string
  end
end
