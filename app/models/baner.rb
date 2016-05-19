class Baner < ActiveRecord::Base
  attr_accessible :kode, :likeurl, :position, :showcount, :clickcount, :showshowcount, :showclickcount, :gourl
  belongs_to :position
  attr_accessible :position_id
  
  attr_accessible :banerimage
  has_attached_file :banerimage, :styles => {:thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :banerimage, :content_type => /\Aimage\/.*\Z/
  
  rails_admin do
    navigation_label I18n.t('menu.admin')
    weight -1
    configure :kode do
      visible(false)
    end
    list do
      field :position
      field :banerimage
      field :gourl
      field :showcount
      field :clickcount
    end
    edit do
      group :statistic do
        label I18n.t('group.statistic')
      end
      include_all_fields
      fields :showcount, :clickcount  do 
        group :statistic
      end
    end
  end
  scope :toclickcount, -> { where('showclickcount = 0 OR showclickcount >= clickcount') }
  scope :toshowcount, -> { where('showshowcount = 0 OR showshowcount >= showcount') }
  
  validates :position, presence: true
end
