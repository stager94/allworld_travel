class AddGorodasortToAllsettings < ActiveRecord::Migration
  def change
    add_column :allsettings, :gorodasort, :integer
  end
end
