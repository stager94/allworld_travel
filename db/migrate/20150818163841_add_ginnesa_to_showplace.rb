class AddGinnesaToShowplace < ActiveRecord::Migration
  def change
    add_column :showplaces, :ginnesa, :boolean
  end
end
