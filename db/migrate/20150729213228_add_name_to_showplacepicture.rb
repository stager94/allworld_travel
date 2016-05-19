class AddNameToShowplacepicture < ActiveRecord::Migration
  def change
    add_column :showplacepictures, :name, :string
  end
end
