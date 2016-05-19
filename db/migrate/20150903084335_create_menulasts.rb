class CreateMenulasts < ActiveRecord::Migration
  def change
    create_table :menulasts do |t|
      t.string :name
      t.integer :sortorder
      t.text :hint
      t.string :h1
      t.text :keywords
      t.text :description
      t.text :page

      t.timestamps null: false
    end
  end
end
