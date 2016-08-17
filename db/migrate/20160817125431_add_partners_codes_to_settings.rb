class AddPartnersCodesToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :hotels, :text
    add_column :settings, :flights, :text
    add_column :settings, :car_rental, :text
  end
end
