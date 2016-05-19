class Category < ActiveRecord::Base
  attr_accessible :descrip, :hint, :name, :sortorder
  has_one :tag, :as => :content
  has_many :showplaces
  after_create :add_tag
  
  def add_tag
    self.tag = Tag.new
    tag  = self.name.to_slug_param
    i    = 1
    ttag = tag
    while Tag.find_by_name(ttag).present? 
      ttag  = tag + '_' + i.to_s
      i = i + 1
    end
    self.tag.name = ttag
    self.tag.save
  end
  rails_admin do
    navigation_label I18n.t('menu.menu')
    list do
      sort_by :sortorder
      field :sortorder
      field :name
      field :tag
    end
    edit do
      include_all_fields
      field :descrip, :ck_editor
      field :hint, :ck_editor
    end
  end

end
