class AddCaptionToTextblocks < ActiveRecord::Migration
  def change
    add_column :placetextblocks, :caption, :string
    add_column :countrytextblocks, :caption, :string
  end
end
