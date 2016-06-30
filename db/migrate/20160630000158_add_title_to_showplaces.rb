class AddTitleToShowplaces < ActiveRecord::Migration
  def change
    add_column :showplaces, :title, :string

    Showplace.all.find_each { |showplace| showplace.update title: showplace.name }
  end
end
