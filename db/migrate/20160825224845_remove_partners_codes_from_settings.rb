class RemovePartnersCodesFromSettings < ActiveRecord::Migration
  def change
  	remove_column :settings, :car_rental
  	remove_column :settings, :hotels
  	remove_column :settings, :flights
  end
end
