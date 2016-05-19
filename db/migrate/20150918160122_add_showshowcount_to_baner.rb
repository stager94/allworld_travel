class AddShowshowcountToBaner < ActiveRecord::Migration
  def change
    add_column :baners, :showshowcount, :integer, default: 0
  end
end
