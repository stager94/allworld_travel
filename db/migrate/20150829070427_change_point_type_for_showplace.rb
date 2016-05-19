class ChangePointTypeForShowplace < ActiveRecord::Migration
  def change
    change_column :showplaces, :point, :decimal, precision: 5, scale: 1
  end
end
