class CreateFootersubmenus < ActiveRecord::Migration
  def change
    create_table :footersubmenus do |t|
      t.string :name
      t.integer :sortorder
      t.string :url
      t.references :footermenu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
