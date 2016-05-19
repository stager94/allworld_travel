class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.text :descrip
      t.text :hint

      t.timestamps
    end
  end
end
