class AddContactadressToAllsetting < ActiveRecord::Migration
  def change
    add_column :allsettings, :contactadress, :string
  end
end
