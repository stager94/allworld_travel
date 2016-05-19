class AddShowhomeToShowplace < ActiveRecord::Migration
  def change
    add_column :showplaces, :showhome, :boolean, :default => true
  end
end
