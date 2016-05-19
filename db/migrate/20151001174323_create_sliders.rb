class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :name
      t.text :description
      t.integer :sortorder
      t.boolean :showinroot, null: false, default: true
      t.boolean :showinguide, null: false, default: true

      t.timestamps null: false
    end
  end
end
