class Tag < ActiveRecord::Base
  attr_accessible :content, :name
  belongs_to :content, :polymorphic => true
  rails_admin do
    navigation_label I18n.t('menu.system')
  end
end
