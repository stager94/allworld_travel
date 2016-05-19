class Newsvideo < ActiveRecord::Base
  attr_accessible :news_id, :name, :kode
  belongs_to :news, :inverse_of => :newsvideos
  rails_admin do
    parent 'News'
  end
end
