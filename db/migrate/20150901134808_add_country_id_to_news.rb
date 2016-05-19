class AddCountryIdToNews < ActiveRecord::Migration
  def change
    add_column :news, :country_id, :integer
  end
end
