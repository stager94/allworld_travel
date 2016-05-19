class AddCopyrightToAllsetting < ActiveRecord::Migration
  def change
    add_column :allsettings, :copyright, :text
  end
end
