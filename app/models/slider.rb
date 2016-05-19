class Slider < ActiveRecord::Base
  attr_accessible :image, :name, :description, :showinroot, :showinguide, :sortorder
  has_attached_file :image, :styles => { :slide => "1200x505#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  rails_admin do
    navigation_label I18n.t('menu.setting')
  end
end
