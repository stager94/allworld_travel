class AddShowclickcountToBaner < ActiveRecord::Migration
  def change
    add_column :baners, :showclickcount, :integer, default: 0
  end
end
