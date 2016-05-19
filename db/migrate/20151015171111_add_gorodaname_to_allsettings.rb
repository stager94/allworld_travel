class AddGorodanameToAllsettings < ActiveRecord::Migration
  def change
    add_column :allsettings, :gorodaname, :string
  end
end
