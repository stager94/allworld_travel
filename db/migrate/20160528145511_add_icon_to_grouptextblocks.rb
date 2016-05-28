class AddIconToGrouptextblocks < ActiveRecord::Migration
  def change
    add_attachment :grouptextblocks, :icon
  end
end
