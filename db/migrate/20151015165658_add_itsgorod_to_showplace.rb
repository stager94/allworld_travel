class AddItsgorodToShowplace < ActiveRecord::Migration
  def change
    add_column :showplaces, :itsgorod, :boolean, :default => false
  end
end
