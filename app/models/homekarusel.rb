class Homekarusel < ActiveRecord::Base
  attr_accessible :name, :sortorder, :image
  has_attached_file :image, :styles => { :block => "360x250#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  rails_admin do
    navigation_label I18n.t('menu.setting')
  end

end
