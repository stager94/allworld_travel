class AddGooglemapToRegion < ActiveRecord::Migration
  def change
    add_column :regions, :googlemap, :text
  end
end
