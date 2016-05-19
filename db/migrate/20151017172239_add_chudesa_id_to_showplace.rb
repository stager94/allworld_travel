class AddChudesaIdToShowplace < ActiveRecord::Migration
  def change
    add_column :showplaces, :chudesa_id, :integer
  end
end
