class AddBlocklinkToCountrytextblock < ActiveRecord::Migration
  def change
    add_column :countrytextblocks, :blocklink, :text
  end
end
