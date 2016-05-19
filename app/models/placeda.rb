class Placeda < ActiveRecord::Base
  belongs_to :user
  belongs_to :showplace
  attr_accessible :user_id, :showplace_id
end
