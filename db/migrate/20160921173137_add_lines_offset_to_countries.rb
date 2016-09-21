class AddLinesOffsetToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :lines_offset, :integer, default: 0
  end
end
