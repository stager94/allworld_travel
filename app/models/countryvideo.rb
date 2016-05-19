class Countryvideo < ActiveRecord::Base
  belongs_to :country, :inverse_of => :countryvideos
  attr_accessible :country_id
  attr_accessible :kode, :name
  rails_admin do
    parent 'Country'
  end
end
