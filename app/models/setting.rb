class Setting < ActiveRecord::Base

  attr_accessible :top100_text

	has_attached_file :favicon, styles: { 
		desktop: "32x32#", 
		apple_touch: "120x120#",
		apple_touch72: "72x72#",
		apple_touch114: "114x114#",
		apple_touch144: "144x144#"
	}
  validates_attachment_content_type :favicon, content_type: /\Aimage\/.*\Z/

  has_attached_file :logotype, styles: { header: "35x35#" }
  validates_attachment_content_type :logotype, content_type: /\Aimage\/.*\Z/

  has_attached_file :watermark
  validates_attachment_content_type :watermark, content_type: /\Aimage\/.*\Z/

  def self.instance
  	self.first || self.create
  end

  def self.favicon(style = :desktop)
  	instance.favicon.url(style)
  end

  def self.sitename
  	instance.sitename
  end

  def self.logotype(style = :original)
  	instance.logotype.url(style)
  end

  def self.top100_text(style = :original)
    instance.top100_text
  end

  rails_admin do
    include_all_fields
    field :top100_text, :ck_editor
  end

end
