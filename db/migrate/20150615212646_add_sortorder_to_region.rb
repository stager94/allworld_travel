class AddSortorderToRegion < ActiveRecord::Migration
  def change
    add_column :regions, :sortorder, :integer
  end
end
