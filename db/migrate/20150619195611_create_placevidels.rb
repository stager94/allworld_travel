class CreatePlacevidels < ActiveRecord::Migration
  def change
    create_table :placevidels do |t|
      t.references :user
      t.references :showplace

      t.timestamps
    end
    add_index :placevidels, :user_id
    add_index :placevidels, :showplace_id
  end
end
