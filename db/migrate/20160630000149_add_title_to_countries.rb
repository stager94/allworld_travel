class AddTitleToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :title, :string

    Country.all.find_each { |country| country.update title: country.name }
  end
end
