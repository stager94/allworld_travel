class CreateChudesas < ActiveRecord::Migration
  def change
    create_table :chudesas do |t|
      t.string :name
      t.text :toptext
      t.text :bottomtext
      t.integer :sortorder
      t.references :showplace, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
