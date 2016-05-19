class CreateTextblocks < ActiveRecord::Migration
  def change
    create_table :textblocks do |t|
      t.string :name
      t.integer :sortorder
      t.references :grouptextblock, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
