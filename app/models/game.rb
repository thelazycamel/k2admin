class Game < ActiveRecord::Base

  has_many :user_tournament_details
  belongs_to :tournament

end
