class CreateShowplaces < ActiveRecord::Migration
  def change
    create_table :showplaces do |t|
      t.string :name
      t.string :h1
      t.text :keywords
      t.text :description
      t.string :tag
      t.text :shortdesc
      t.text :googlemap
      t.text :fulldesc
      t.text :primech
      t.references :section
      t.references :category
      t.references :group
      t.references :region
      t.string :datapostroyki
      t.boolean :lose
      t.boolean :wonders7
      t.boolean :top100
      t.boolean :unesco

      t.timestamps
    end
    add_index :showplaces, :section_id
    add_index :showplaces, :category_id
    add_index :showplaces, :group_id
    add_index :showplaces, :region_id
  end
end
