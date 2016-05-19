class AddTagToMenulast < ActiveRecord::Migration
  def change
    add_column :menulasts, :tag, :string
  end
end
