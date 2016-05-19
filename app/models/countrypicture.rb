class Countrypicture < ActiveRecord::Base
  belongs_to :country, :inverse_of => :countrypictures
  attr_accessible :country_id, :name
  # attr_accessible :title, :body
  attr_accessible :image
  has_attached_file :image, :processors => [:watermark], :styles => { :medium => "560x400#", :large => {:geometry => '1200x900#', :watermark_path => "#{Rails.root}/public/img/large_watermark.png" } }, :default_url => "/img/blank/:style/pustota.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  rails_admin do
    parent 'Country'
  end

end
