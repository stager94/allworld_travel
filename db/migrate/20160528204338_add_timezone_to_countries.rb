class AddTimezoneToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :timezone, :string, default: 'UTC'
  end
end
