class CreateFootermenus < ActiveRecord::Migration
  def change
    create_table :footermenus do |t|
      t.string :name
      t.integer :sortorder

      t.timestamps null: false
    end
  end
end
