class AddLeftmenusortToAllsettings < ActiveRecord::Migration
  def change
    add_column :allsettings, :leftmenusort, :integer
  end
end
