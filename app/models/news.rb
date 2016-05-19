class News < ActiveRecord::Base
  attr_accessible :name, :h1, :keywords, :description, :page, :tag
  has_many :newspictures, :dependent => :destroy, :inverse_of => :news
  has_many :newsvideos, :dependent => :destroy, :inverse_of => :news
  attr_accessible :newspicture_id
  attr_accessible :newspicture_ids
  attr_accessible :newspictures_attributes
  accepts_nested_attributes_for :newspictures, :allow_destroy => true
  attr_accessible :newsvideo_id
  attr_accessible :newsvideo_ids
  attr_accessible :newsvideos_attributes
  accepts_nested_attributes_for :newsvideos, :allow_destroy => true
  belongs_to :country, :inverse_of => :news
  attr_accessible :country_id

  before_create :add_tag
  
  def add_tag
    self.tag = self.name.to_slug_param
  end

  rails_admin do
    navigation_label I18n.t('menu.content')
    weight -5
    list do
      field :name
      field :tag
    end
    edit do
      include_all_fields
      field :page, :ck_editor
    end
  end
end