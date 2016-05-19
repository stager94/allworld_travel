class AddShowplaceIdToCountrytextblock < ActiveRecord::Migration
  def change
    add_column :countrytextblocks, :showplace_id, :integer
  end
end
