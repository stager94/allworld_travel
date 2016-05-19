class Mainmenu < ActiveRecord::Base
  attr_accessible :name, :sortorder, :url
  rails_admin do
    navigation_label I18n.t('menu.menu')
  end
end
