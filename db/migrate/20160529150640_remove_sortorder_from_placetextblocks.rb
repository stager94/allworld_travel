class RemoveSortorderFromPlacetextblocks < ActiveRecord::Migration
  def change
  	remove_column :placetextblocks, :sortorder, :integer
  end
end
