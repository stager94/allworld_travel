class AddVisibleToShowplaces < ActiveRecord::Migration
  def change
    add_column :showplaces, :visible, :boolean, default: true
  end
end
