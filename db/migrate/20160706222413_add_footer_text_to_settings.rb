class AddFooterTextToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :footer_text, :text
  end
end
