class AddShowincountryToShowplace < ActiveRecord::Migration
  def change
    add_column :showplaces, :showincountry, :boolean, :default => true
  end
end
