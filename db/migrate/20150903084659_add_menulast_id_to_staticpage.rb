class AddMenulastIdToStaticpage < ActiveRecord::Migration
  def change
    add_column :staticpages, :menulast_id, :integer
  end
end
