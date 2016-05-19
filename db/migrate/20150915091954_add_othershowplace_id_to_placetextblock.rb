class AddOthershowplaceIdToPlacetextblock < ActiveRecord::Migration
  def change
    add_column :placetextblocks, :othershowplace_id, :integer
  end
end
