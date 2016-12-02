class AddPostedOnAndSourceUrlToNews < ActiveRecord::Migration
  def change
    add_column :news, :posted_on, :date
    add_column :news, :news_source_url, :string
  end
end
