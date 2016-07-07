class AddDeleteImageToPlacetextblocks < ActiveRecord::Migration
  def change
    add_column :placetextblocks, :delete_image, :boolean, default: false
  end
end
