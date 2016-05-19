class CreateGrouptextblocks < ActiveRecord::Migration
  def change
    create_table :grouptextblocks do |t|
      t.string :name
      t.integer :sortorder

      t.timestamps null: false
    end
  end
end
