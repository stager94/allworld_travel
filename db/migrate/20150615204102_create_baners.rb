class CreateBaners < ActiveRecord::Migration
  def change
    create_table :baners do |t|
      t.text :kode
      t.integer :showcount
      t.references :position
      t.string :likeurl

      t.timestamps
    end
  end
end
