class Footersubmenu < ActiveRecord::Base
  belongs_to :footermenu
  attr_accessible :name, :sortorder, :url, :footermenu_id, :icon

  attr_accessible :icon
  has_attached_file :icon, styles: { micro: "50x50>" }, default_url: ""
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/

  rails_admin do
    parent 'Footermenu'
  end
end
