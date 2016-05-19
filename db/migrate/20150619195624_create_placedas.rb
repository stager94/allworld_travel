class CreatePlacedas < ActiveRecord::Migration
  def change
    create_table :placedas do |t|
      t.references :user
      t.references :showplace

      t.timestamps
    end
    add_index :placedas, :user_id
    add_index :placedas, :showplace_id
  end
end
