class Chudesa < ActiveRecord::Base
  attr_accessible :name, :toptext, :bottomtext, :sortorder

  has_many :showplaces, :inverse_of => :chudesa
  attr_accessible :showplace_ids
  attr_accessible :showplaces_attributes
  accepts_nested_attributes_for :showplaces
  rails_admin do
    configure :showplace_id do
      visible(false)
    end
    navigation_label I18n.t('menu.menu')
  end

end
