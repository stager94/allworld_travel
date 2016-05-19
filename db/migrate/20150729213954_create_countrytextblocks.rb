class CreateCountrytextblocks < ActiveRecord::Migration
  def change
    create_table :countrytextblocks do |t|
      t.text :fulltext
      t.integer :sortorder
      t.references :country, index: true, foreign_key: true
      t.references :textblock, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
