class Tournament < ActiveRecord::Base

  has_many :user_tournament_details

  paginates_per 10

end

