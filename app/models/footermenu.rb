class Footermenu < ActiveRecord::Base
  has_many :footersubmenus, dependent: :destroy
  attr_accessible :name, :sortorder

  rails_admin do
    navigation_label I18n.t('menu.menu')
  end
end
