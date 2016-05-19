class AddShowinsectionToShowplace < ActiveRecord::Migration
  def change
    add_column :showplaces, :showinsection, :boolean, :default => true
  end
end
