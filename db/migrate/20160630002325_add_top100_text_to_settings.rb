class AddTop100TextToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :top100_text, :text
  end
end
