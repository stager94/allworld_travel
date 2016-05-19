class Menulast < ActiveRecord::Base
  attr_accessible :description, :h1, :keywords, :name, :sortorder, :hint, :page, :tag 
  has_many :staticpages, :inverse_of => :menulast
  attr_accessible :staticpage_ids
  attr_accessible :staticpages_attributes
  accepts_nested_attributes_for :staticpages
  before_create :add_tag
  
  def add_tag
    self.tag = self.name.to_slug_param
  end
  
  rails_admin do
    configure :staticpages do
      visible(false)
    end
    navigation_label I18n.t('menu.menu')
    list do
      field :name
      field :tag
    end
    edit do
      include_all_fields
      field :page, :ck_editor
      field :hint, :ck_editor
    end
  end

end
