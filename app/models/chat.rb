class Chat < ActiveRecord::Base

  belongs_to :user
  belongs_to :tournament

  paginates_per 10

end
