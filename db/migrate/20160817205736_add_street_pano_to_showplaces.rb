class AddStreetPanoToShowplaces < ActiveRecord::Migration
  def change
    add_column :showplaces, :street_pano, :text
  end
end
