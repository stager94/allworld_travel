class AddCountriesToPlacedas < ActiveRecord::Migration
  def change
    add_column :placedas, :countries, :text
  end
end
