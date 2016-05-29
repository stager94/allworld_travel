class Showplacepicture < ActiveRecord::Base
  belongs_to :showplace, :inverse_of => :showplacepictures
  attr_accessible :showplace_id, :name, :position
  # attr_accessible :title, :body
  attr_accessible :image
  has_attached_file :image, :processors => [:watermark], :styles => { :medium => "560x400#", :large => {:geometry => '1200x900#', :watermark_path => "#{Rails.root}/public/img/large_watermark.png" } }, :default_url => "/img/blank/:style/pustota.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  default_scope ->{ order(:position) }
  acts_as_positioned under: :showplace

  rails_admin do
    parent 'Showplace'
  end
  
end
