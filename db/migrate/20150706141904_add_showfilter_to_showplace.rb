class AddShowfilterToShowplace < ActiveRecord::Migration
  def change
    add_column :showplaces, :showfilter, :boolean, :default => true
  end
end
