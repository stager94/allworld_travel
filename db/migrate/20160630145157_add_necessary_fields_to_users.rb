class AddNecessaryFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :facebook_link, :string
    add_column :users, :twitter_link, :string
    add_column :users, :vk_link, :string
    add_column :users, :instagram_link, :string
    add_column :users, :google_link, :string
  end
end
