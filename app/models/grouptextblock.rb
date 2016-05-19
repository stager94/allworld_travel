class Grouptextblock < ActiveRecord::Base
  has_many :textblocks, :dependent => :destroy, :inverse_of => :grouptextblock
  attr_accessible :name, :sortorder
  
  rails_admin do
    navigation_label I18n.t('menu.setting')
    configure :textblocks do
      visible(false)
    end
    list do
      field :name
      field :sortorder
    end
    edit do
      include_all_fields
    end
  end

end
