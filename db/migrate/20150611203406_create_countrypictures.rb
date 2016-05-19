class CreateCountrypictures < ActiveRecord::Migration
  def change
    create_table :countrypictures do |t|
      t.references :country

      t.timestamps
    end
    add_index :countrypictures, :country_id
  end
end
