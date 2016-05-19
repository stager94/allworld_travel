class CreateShowplacevideos < ActiveRecord::Migration
  def change
    create_table :showplacevideos do |t|
      t.text :kode
      t.references :showplace

      t.timestamps
    end
    add_index :showplacevideos, :showplace_id
  end
end
