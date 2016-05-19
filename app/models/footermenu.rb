class Footermenu < ActiveRecord::Base
  has_many :footersubmenus
  attr_accessible :name, :sortorder

  rails_admin do
    navigation_label I18n.t('menu.menu')
  end
end
