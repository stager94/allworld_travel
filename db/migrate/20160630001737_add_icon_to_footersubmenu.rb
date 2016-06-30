class AddIconToFootersubmenu < ActiveRecord::Migration
  def change
    add_attachment :footersubmenus, :icon
  end
end
