class Newspicture < ActiveRecord::Base
  attr_accessible :news_id, :name
  belongs_to :news, :inverse_of => :newspictures
  attr_accessible :image
  has_attached_file :image, :styles => { :medium => "560x400#", :thumb => "420x300#", :micro => "70x50#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  rails_admin do
    parent 'News'
  end
end
