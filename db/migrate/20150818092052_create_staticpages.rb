class CreateStaticpages < ActiveRecord::Migration
  def change
    create_table :staticpages do |t|
      t.string :name
      t.string :h1
      t.text :keywords
      t.text :description
      t.text :page
      t.string :tag

      t.timestamps null: false
    end
  end
end
