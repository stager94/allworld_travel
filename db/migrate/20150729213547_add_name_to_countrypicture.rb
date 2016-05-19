class AddNameToCountrypicture < ActiveRecord::Migration
  def change
    add_column :countrypictures, :name, :string
  end
end
