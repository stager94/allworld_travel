class AddPointToShowplace < ActiveRecord::Migration
  def change
    add_column :showplaces, :point, :integer
  end
end
