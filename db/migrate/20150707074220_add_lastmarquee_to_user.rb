class AddLastmarqueeToUser < ActiveRecord::Migration
  def change
    add_column :users, :lastmarquee, :integer
  end
end
