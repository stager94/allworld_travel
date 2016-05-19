class AddFullcountryarrayToPlacevidel < ActiveRecord::Migration
  def change
    add_column :placevidels, :fullcountryarray, :string
  end
end
