class Countrytextblock < ActiveRecord::Base

  default_scope ->{ order(:position) }
  acts_as_positioned under: :country

  belongs_to :country, :inverse_of => :countrytextblocks
  belongs_to :textblock, :inverse_of => :countrytextblocks
  belongs_to :showplace, :inverse_of => :countrytextblocks
  attr_accessible :textblock_id
  attr_accessible :showplace_id
  attr_accessible :country_id
  attr_accessible :image, :lines_offset
  has_attached_file :image, :styles => { :medium => "560x400#", :thumb => "208x149#" }, :default_url => "/img/countrytextblock/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  attr_accessible :fulltext, :position, :blocklink, :caption
  validates :textblock, presence: true
  rails_admin do
    parent 'Country'
    edit do
      include_all_fields
      field :fulltext, :ck_editor
    end
  end
end
