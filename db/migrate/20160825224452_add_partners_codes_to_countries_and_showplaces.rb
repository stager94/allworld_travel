class AddPartnersCodesToCountriesAndShowplaces < ActiveRecord::Migration
  def change
    add_column :countries, :hotels_code, :text
    add_column :showplaces, :hotels_code, :text
    add_column :countries, :flights_code, :text
    add_column :showplaces, :flights_code, :text
    add_column :countries, :car_rental_code, :text
    add_column :showplaces, :car_rental_code, :text
  end
end
