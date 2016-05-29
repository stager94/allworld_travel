class AddPositionToShowplacepicture < ActiveRecord::Migration
  def change
    add_column :showplacepictures, :position, :integer, default: 0
  end
end
