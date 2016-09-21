class AddLinesOffsetToShowplaces < ActiveRecord::Migration
  def change
    add_column :showplaces, :lines_offset, :integer, default: 0
  end
end
