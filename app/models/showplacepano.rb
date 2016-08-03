class Showplacepano < ActiveRecord::Base
	belongs_to :showplace, inverse_of: :showplacepanos
	attr_accessible :showplace_id, :title, :src

  attr_accessible :thumb
  has_attached_file :thumb, :processors => [:watermark], :styles => { :medium => "560x400#", :large => {:geometry => '1200x900#', :watermark_path => "#{Rails.root}/public/img/large_watermark.png" } }, :default_url => "/img/blank/:style/pustota.png"
  validates_attachment_content_type :thumb, :content_type => /\Aimage\/.*\Z/


	rails_admin do
    parent 'Showplace'
  end
end
