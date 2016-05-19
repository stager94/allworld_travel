class Linkobjtocount < ActiveRecord::Base
  belongs_to :showplace
  belongs_to :country
  attr_accessible :showplace_id
  accepts_nested_attributes_for :showplace
  attr_accessible :country_id
  accepts_nested_attributes_for :country

  # attr_accessible :title, :body
end
