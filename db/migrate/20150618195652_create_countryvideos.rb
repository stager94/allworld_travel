class CreateCountryvideos < ActiveRecord::Migration
  def change
    create_table :countryvideos do |t|
      t.text :kode
      t.references :country

      t.timestamps
    end
    add_index :countryvideos, :country_id
  end
end
