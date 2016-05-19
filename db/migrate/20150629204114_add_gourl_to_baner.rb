class AddGourlToBaner < ActiveRecord::Migration
  def change
    add_column :baners, :gourl, :text
  end
end
