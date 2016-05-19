class CreateShowplacepictures < ActiveRecord::Migration
  def change
    create_table :showplacepictures do |t|
      t.references :showplace

      t.timestamps
    end
    add_index :showplacepictures, :showplace_id
  end
end
