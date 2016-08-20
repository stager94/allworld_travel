class Staticpage < ActiveRecord::Base
  attr_accessible :name, :h1, :keywords, :description, :page, :tag
  belongs_to :menulast, :inverse_of => :staticpages
  attr_accessible :menulast_id
  before_create :add_tag
  
  def add_tag
    self.tag = self.name.to_slug_param
  end

  def url
    "/article/" + tag
  end

  rails_admin do
    parent 'Menulast'
    list do
      field :name
      field :tag
      field :url
    end
    edit do
      group :meta do
        label I18n.t('group.meta')
      end
      group :slugebnoe do
        label I18n.t('group.slugebnoe')
      end
      group :obshee do
        label I18n.t('group.obshee')
      end
      include_all_fields
      field :page, :ck_editor
      fields :description, :h1, :keywords, :name  do 
        group :meta
      end
      fields :page  do 
        group :obshee
      end
      fields :tag, :menulast  do 
        group :slugebnoe
      end
    end
  end
end
