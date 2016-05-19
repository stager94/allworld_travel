class CreateHomekarusels < ActiveRecord::Migration
  def change
    create_table :homekarusels do |t|
      t.string :name
      t.integer :sortorder

      t.timestamps null: false
    end
  end
end
