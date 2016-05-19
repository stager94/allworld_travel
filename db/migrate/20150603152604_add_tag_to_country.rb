class AddTagToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :tag, :string
  end
end
