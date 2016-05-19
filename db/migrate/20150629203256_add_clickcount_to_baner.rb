class AddClickcountToBaner < ActiveRecord::Migration
  def change
    add_column :baners, :clickcount, :integer
  end
end
