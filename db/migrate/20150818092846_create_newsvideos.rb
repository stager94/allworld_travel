class CreateNewsvideos < ActiveRecord::Migration
  def change
    create_table :newsvideos do |t|
      t.string :name
      t.text :kode
      t.references :news, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
