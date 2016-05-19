class CreateMarquees < ActiveRecord::Migration
  def change
    create_table :marquees do |t|
      t.text :full
      t.integer :showcount

      t.timestamps
    end
  end
end
