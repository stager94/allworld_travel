class CreateCountrypanos < ActiveRecord::Migration
  def change
    create_table :countrypanos do |t|
      t.string :title
      t.text :src
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
