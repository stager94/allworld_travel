class AddPositionToCountrytextblocks < ActiveRecord::Migration
  def change
    add_column :countrytextblocks, :position, :integer, default: 0
    Countrytextblock.find_each { |b| b.save! }
  end
end
