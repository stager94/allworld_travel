class AddSortorderToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :sortorder, :integer
  end
end
