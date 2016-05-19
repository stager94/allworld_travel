class Showplace < ActiveRecord::Base

  belongs_to :section, :inverse_of => :showplaces
  attr_accessible :section_id
  belongs_to :chudesa, :inverse_of => :showplaces
  attr_accessible :chudesa_id
  belongs_to :category, :inverse_of => :showplaces
  attr_accessible :category_id
  belongs_to :group, :inverse_of => :showplaces
  attr_accessible :group_id
  belongs_to :region, :inverse_of => :showplaces
  attr_accessible :region_id
  attr_accessible :datapostroyki, :description, :fulldesc, :googlemap, :h1, :keywords, :lose, :name, :primech, :shortdesc, :tag, :top100, :unesco, :wonders7, :point, :showfilter, :showhome, :ginnesa
  attr_accessible :showinsection, :showincountry, :itsgorod

  has_many :placedas, :dependent => :destroy
  has_many :placenets, :dependent => :destroy
  has_many :placevidels, :dependent => :destroy
  has_many :countrytextblocks
  
  has_many :linkobjtocounts, :dependent => :destroy
  attr_accessible :linkobjtocount_id
  attr_accessible :linkobjtocounts_attributes

  
  has_many :countries, through: :linkobjtocounts, :inverse_of => :showplaces
  attr_accessible :country_ids
  attr_accessible :countries_attributes
  
  
  has_many :showplacepictures, :dependent => :destroy, :inverse_of => :showplace
  attr_accessible :showplacepicture_ids
  attr_accessible :showplacepictures_attributes
  accepts_nested_attributes_for :showplacepictures, :allow_destroy => true



  has_many :showplacevideos, :dependent => :destroy, :inverse_of => :showplace
  attr_accessible :showplacevideo_ids
  attr_accessible :showplacevideos_attributes
  accepts_nested_attributes_for :showplacevideos, :allow_destroy => true

  has_many :placetextblocks, :dependent => :destroy, :inverse_of => :showplace
  attr_accessible :placetextblock_ids
  attr_accessible :placetextblocks_attributes
  accepts_nested_attributes_for :placetextblocks, :allow_destroy => true
  
  before_create :add_tag
  before_validation :comma_to_delimiter
  
  def add_tag
    self.tag = self.name.to_slug_param
  end


  def comma_to_delimiter
    self.point.to_s.gsub(',', '.').to_f
  end  
  
  rails_admin do
    navigation_label I18n.t('menu.content')
    weight -8
    configure :linkobjtocounts do
      visible(false)
    end
    configure :countrytextblocks do
      visible(false)
    end
    configure :countries do
      orderable true
    end
    configure :placedas do
      visible(false)
    end
    configure :placenets do
      visible(false)
    end
    configure :placevidels do
      visible(false)
    end
    list do
      field :name
      field :countries
      field :category
      field :region
      field :tag
    end
    edit do
      group :meta do
        label I18n.t('group.meta')
      end
      group :obshee do
        label I18n.t('group.obshee')
      end
      group :shapka do
        label I18n.t('group.shapka')
      end
      group :mediainfo do
        label I18n.t('group.mediainfo')
      end
      group :slugebnoe do
        label I18n.t('group.slugebnoe')
      end
      group :allother do
        label I18n.t('group.allother')
      end
      group :navigates do
        label I18n.t('group.navigates')
      end
      include_all_fields
      field :fulldesc, :ck_editor
      field :shortdesc, :ck_editor
      field :primech, :ck_editor
      fields :datapostroyki, :lose, :top100, :unesco, :wonders7, :ginnesa, :chudesa do 
        group :obshee
      end
      fields :description, :h1, :keywords, :name  do 
        group :meta
      end
      fields  :shortdesc, :fulldesc, :primech  do 
        group :shapka
      end
      fields :googlemap, :showplacepictures, :showplacevideos  do 
        group :mediainfo
      end
      fields :tag, :point, :showfilter, :showhome, :showinsection, :showincountry, :itsgorod  do 
        group :slugebnoe
      end
      fields :section, :category, :group, :region, :countries  do 
        group :navigates
      end
      field :placetextblocks  do 
        group :allother
      end
    end
  end
end
