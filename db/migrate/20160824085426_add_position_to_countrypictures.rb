class AddPositionToCountrypictures < ActiveRecord::Migration
  def change
    add_column :countrypictures, :position, :integer, default: 0
    Countrypicture.find_each { |b| b.save! }
  end
end
