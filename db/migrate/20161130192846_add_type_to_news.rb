class AddTypeToNews < ActiveRecord::Migration
  def change
    add_column :news, :news_type, :integer
  end
end
