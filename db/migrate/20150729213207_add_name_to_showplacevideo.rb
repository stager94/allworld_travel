class AddNameToShowplacevideo < ActiveRecord::Migration
  def change
    add_column :showplacevideos, :name, :string
  end
end
