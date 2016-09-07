class AddStandardLinesCountToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :standard_lines_count, :integer, default: 8
  end
end
