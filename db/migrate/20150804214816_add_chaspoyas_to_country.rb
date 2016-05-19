class AddChaspoyasToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :chaspoyas, :integer, :null => false, :default => 0
  end
end
