class AddLinesOffsetToCountrytextblocks < ActiveRecord::Migration
  def change
    add_column :countrytextblocks, :lines_offset, :integer, default: 0
  end
end
