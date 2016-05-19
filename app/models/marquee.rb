class Marquee < ActiveRecord::Base
  attr_accessible :full, :showcount
  rails_admin do
    navigation_label I18n.t('menu.content')
    weight -2
  end
end
