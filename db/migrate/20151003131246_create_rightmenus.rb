class CreateRightmenus < ActiveRecord::Migration
  def change
    create_table :rightmenus do |t|
      t.string :name
      t.integer :sortorder
      t.string :url

      t.timestamps null: false
    end
  end
end
