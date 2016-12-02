class AddPostedOnAndSourceUrlToNews < ActiveRecord::Migration
  def change
    add_column :news, :posted_on, :date
    add_column :news, :source_url, :string
  end
end
