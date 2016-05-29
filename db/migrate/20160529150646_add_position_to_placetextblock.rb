class AddPositionToPlacetextblock < ActiveRecord::Migration
  def change
    add_column :placetextblocks, :position, :integer, default: 0
    Placetextblock.find_each { |b| b.save! }
  end
end
