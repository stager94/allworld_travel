class AddBlocklinkToPlacetextblock < ActiveRecord::Migration
  def change
    add_column :placetextblocks, :blocklink, :text
  end
end
