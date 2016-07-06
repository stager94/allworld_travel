class AddFooterInformationToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :system_email, :string
    add_column :settings, :vk_link, :string
    add_column :settings, :fb_link, :string
    add_column :settings, :instagram_link, :string
    add_column :settings, :twitter_link, :string
    add_column :settings, :youtube_link, :string
    add_column :settings, :google_link, :string
  end
end
