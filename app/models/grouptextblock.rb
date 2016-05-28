class Grouptextblock < ActiveRecord::Base
  has_many :textblocks, :dependent => :destroy, :inverse_of => :grouptextblock
  attr_accessible :name, :sortorder

  has_attached_file :icon, styles: { small: "60x60#" }
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/

  attr_accessible :icon

  before_save :destroy_image?
  
  rails_admin do
    navigation_label I18n.t('menu.setting')
    configure :textblocks do
      visible(false)
    end
    list do
      field :name
      field :sortorder
      field :icon
    end
    edit do
      include_all_fields
    end
  end

end
