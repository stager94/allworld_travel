class Textblock < ActiveRecord::Base
  belongs_to :grouptextblock, :inverse_of => :textblocks
  has_many :placetextblocks, :dependent => :destroy, :inverse_of => :textblock
  has_many :countrytextblocks, :dependent => :destroy, :inverse_of => :textblock
  attr_accessible :name, :sortorder
  attr_accessible :grouptextblock_id
  
  rails_admin do
    navigation_label I18n.t('menu.setting')
    configure :placetextblocks do
      visible(false)
    end
    configure :countrytextblocks do
      visible(false)
    end
    list do
      field :name
      field :grouptextblock
      field :sortorder
    end
    edit do
      include_all_fields
    end
  end
  validates :grouptextblock, presence: true
end
