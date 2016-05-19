class Rightmenu < ActiveRecord::Base
  has_attached_file :image
  attr_accessible :name, :sortorder, :url, :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  rails_admin do
    navigation_label I18n.t('menu.menu')
  end
end
