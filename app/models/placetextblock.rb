class Placetextblock < ActiveRecord::Base
  belongs_to :showplace, :inverse_of => :placetextblocks
  belongs_to :textblock, :inverse_of => :placetextblocks
  belongs_to :othershowplace, :class_name => 'Showplace', :foreign_key => 'othershowplace_id'
  attr_accessible :textblock_id
  attr_accessible :country_id
  attr_accessible :othershowplace_id
  attr_accessible :image, :lines_offset
  has_attached_file :image, :styles => { :medium => "560x400#", :thumb => "416x298#" }, :default_url => "/img/placetextblock/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # has_destroyable_file :image
  attr_accessible :fulltext, :position, :blocklink

  attr_accessible :delete_image

  after_update :disable_clear_image

  # validates :textblock, presence: true
  
  default_scope ->{ order(:position) }
  acts_as_positioned under: :showplace

  rails_admin do
    parent 'Showplace'
    object_label_method do
      :placetextblock_label_method
    end
    edit do
      include_all_fields
      field :fulltext, :ck_editor
      field :delete_image, :froala
      # exclude_fields :delete_image
    end
  end

private

  def disable_clear_image
    if delete_image_changed? && delete_image == true
      self.image.clear
      self.update_attribute :delete_image, false
    end
  end


end
