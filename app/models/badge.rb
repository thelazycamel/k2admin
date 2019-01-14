class Badge < ActiveRecord::Base

  has_many :user_badges

  paginates_per 10

end
