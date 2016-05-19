class CreatePlacetextblocks < ActiveRecord::Migration
  def change
    create_table :placetextblocks do |t|
      t.text :fulltext
      t.integer :sortorder
      t.references :showplace, index: true, foreign_key: true
      t.references :textblock, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
