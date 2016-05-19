class Footersubmenu < ActiveRecord::Base
  belongs_to :footermenu
  attr_accessible :name, :sortorder, :url, :footermenu_id

  rails_admin do
    parent 'Footermenu'
  end
end
