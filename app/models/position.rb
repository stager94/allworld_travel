class Position < ActiveRecord::Base
  attr_accessible :name
  has_many :baners, :dependent => :destroy
  rails_admin do
    navigation_label I18n.t('menu.setting')
    weight -2
  end
end
