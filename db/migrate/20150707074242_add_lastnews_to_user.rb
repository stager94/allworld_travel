class AddLastnewsToUser < ActiveRecord::Migration
  def change
    add_column :users, :lastnews, :integer
  end
end
