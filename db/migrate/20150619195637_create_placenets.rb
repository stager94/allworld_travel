class CreatePlacenets < ActiveRecord::Migration
  def change
    create_table :placenets do |t|
      t.references :user
      t.references :showplace

      t.timestamps
    end
    add_index :placenets, :user_id
    add_index :placenets, :showplace_id
  end
end
