class AddSortorderToSection < ActiveRecord::Migration
  def change
    add_column :sections, :sortorder, :integer
  end
end
