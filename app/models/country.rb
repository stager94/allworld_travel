class Country < ActiveRecord::Base
  belongs_to :region, :inverse_of => :countries
  attr_accessible :region_id
  attr_accessible :description, :h1, :keywords, :name
  attr_accessible :datanezavis, :stolica, :ploscha, :delenie, :glava, :zakon, :ispolnit, :naselenie, :language, :offname, :valute
  attr_accessible :descforturist, :shortdesc
  attr_accessible :googlemap, :title
  attr_accessible :bezopasnost, :ceny, :chtobrat, :chtonugnoznat, :cultura, :dostoprimech,  :internet, :jazik,  :oteli, :pitanie, :politika, :prazdniki, :suvenir, :transport, :valutes, :visum
  attr_accessible :primech, :tag, :chaspoyas, :pogoda, :timezone
  attr_accessible :flights_code, :car_rental_code, :hotels_code

  has_many :children, class_name: "Country", foreign_key: "parent_id"                             
  belongs_to :parent, class_name: "Country"        
  attr_accessible :parent_id

  has_many :linkobjtocounts, :dependent => :destroy
  attr_accessible :linkobjtocount_ids
  accepts_nested_attributes_for :linkobjtocounts, :allow_destroy => true
  attr_accessible :linkobjtocount_attributes
  has_many :showplaces, through: :linkobjtocounts
  attr_accessible :showplace_ids
  accepts_nested_attributes_for :showplaces
  attr_accessible :showplace_attributes
  
  has_many :countrypictures, :dependent => :destroy, :inverse_of => :country
  attr_accessible :countrypicture_ids
  attr_accessible :countrypictures_attributes
  accepts_nested_attributes_for :countrypictures, :allow_destroy => true

  attr_accessible :flag
  has_attached_file :flag, :styles => { :thumb => "140x100#", :micro => "70x50#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :flag, :content_type => /\Aimage\/.*\Z/

  attr_accessible :crest
  has_attached_file :crest, :styles => { :thumb => "140x100>", :micro => "70x50#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :crest, :content_type => /\Aimage\/.*\Z/

  attr_accessible :globus
  has_attached_file :globus, :styles => { :thumb => "360x360#" }, :default_url => "/img/mir.gif"
  validates_attachment_content_type :globus, :content_type => /\Aimage\/.*\Z/

  has_many :countryvideos, :dependent => :destroy, :inverse_of => :country
  attr_accessible :countryvideo_ids
  attr_accessible :countryvideo_id
  attr_accessible :countryvideos_attributes
  accepts_nested_attributes_for :countryvideos, :allow_destroy => true

  has_many :countrytextblocks, :dependent => :destroy, :inverse_of => :country
  attr_accessible :countrytextblock_ids
  attr_accessible :countrytextblocks_attributes
  accepts_nested_attributes_for :countrytextblocks, :allow_destroy => true

  has_many :news, :dependent => :destroy, :inverse_of => :country

  before_create :add_tag
  
  rails_admin do
    navigation_label I18n.t('menu.content')
    weight -10
    configure :linkobjtocounts do
      visible(false)
    end
    configure :children do
      visible(false)
    end
    configure :showplaces do
      visible(false)
    end
    configure :news do
      visible(false)
    end
    list do
      field :name
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
      include_all_fields
      field :descforturist, :ck_editor
      field :shortdesc, :ck_editor
      field :primech, :ck_editor

      fields :bezopasnost, :ceny, :chtobrat, :chtonugnoznat, :cultura, :dostoprimech,  :internet, :jazik,  :oteli, :pitanie, :politika, :prazdniki, :suvenir, :transport, :valutes, :visum do 
        visible(false)
      end
      
      
      fields :datanezavis, :stolica, :ploscha, :delenie, :glava, :zakon, :ispolnit, :naselenie, :language, :offname, :valute do 
        group :obshee
      end
      fields :description, :h1, :keywords, :name, :title  do 
        group :meta
      end
      fields  :shortdesc, :descforturist, :primech  do 
        group :shapka
      end
      fields :flag, :crest, :googlemap, :countrypictures, :countryvideos, :globus, :pogoda  do 
        group :mediainfo
      end
      fields :tag, :region, :parent  do 
        group :slugebnoe
      end
      field :timezone do
        partial :form_timezone
        group :slugebnoe
      end
      field :countrytextblocks  do 
        group :allother
      end
      fields :flights_code, :car_rental_code, :hotels_code do
        group :partners
      end
    end


  end

  def add_tag
    self.tag = self.name.to_slug_param
  end


  def get_flights_code
    flights_code
  end
  def get_hotels_code
    hotels_code
  end
  def get_car_rental_code
    car_rental_code
  end
  def has_partners_codes?
    car_rental_code.present? || flights_code.present? || hotels_code.present?
  end

end
