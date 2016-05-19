class Showplacevideo < ActiveRecord::Base
  belongs_to :showplace, :inverse_of => :showplacevideos
  attr_accessible :country_id
  attr_accessible :kode, :name
  rails_admin do
    parent 'Showplace'
  end

end
