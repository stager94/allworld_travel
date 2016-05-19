class Allsetting < ActiveRecord::Base
  attr_accessible :default, :name, :allcountriesname, :allcountriessort, :allwondersname, :allwonderssort, :allbestname, :allbestsort, :mainmenusort, :leftmenusort, :homeinfografik, :gorodasort, :gorodaname
  attr_accessible :copyright, :contactadress
  has_attached_file :homeinfografik, :styles => { :block => "1200x"}
  validates_attachment_content_type :homeinfografik, :content_type => /\Aimage\/.*\Z/

  rails_admin do
    navigation_label I18n.t('menu.setting')
  end

end
