class AddThumbToCountrypanos < ActiveRecord::Migration
  def change
    add_attachment :countrypanos, :thumb
  end
end
