class CreateAllsettings < ActiveRecord::Migration
  def change
    create_table :allsettings do |t|
      t.boolean :default
      t.string :name
      t.string :allcountriesname
      t.integer :allcountriessort
      t.string :allwondersname
      t.integer :allwonderssort
      t.string :allbestname
      t.integer :allbestsort
      t.integer :mainmenusort

      t.timestamps null: false
    end
  end
end
