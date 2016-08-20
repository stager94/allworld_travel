class AddLinesOffsetToPlacetextblocks < ActiveRecord::Migration
  def change
    add_column :placetextblocks, :lines_offset, :integer, default: 0
  end
end
