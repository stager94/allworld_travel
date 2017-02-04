class AddNewsSourceNameToNews < ActiveRecord::Migration
  def change
    add_column :news, :news_source_name, :string
  end
end
