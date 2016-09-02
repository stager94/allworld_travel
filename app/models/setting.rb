class Setting < ActiveRecord::Base

  attr_accessible :top100_text, :footer_text, :favicon, :logotype
  attr_accessible :system_email
  attr_accessible :vk_link
  attr_accessible :fb_link
  attr_accessible :instagram_link
  attr_accessible :twitter_link
  attr_accessible :youtube_link
  attr_accessible :google_link

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

  def self.footer_text
    instance.footer_text
  end

  def self.system_email
    instance.system_email
  end
  def self.vk_link
    instance.vk_link
  end
  def self.fb_link
    instance.fb_link
  end
  def self.instagram_link
    instance.instagram_link
  end
  def self.twitter_link
    instance.twitter_link
  end
  def self.youtube_link
    instance.youtube_link
  end
  def self.google_link
    instance.google_link
  end

  rails_admin do
    include_all_fields
    field :top100_text, :ck_editor
    field :footer_text, :ck_editor
  end

end
