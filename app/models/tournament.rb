class Tournament < ActiveRecord::Base

  has_many :user_tournament_details
  has_many :users, through: :user_tournament_details
  belongs_to :user
  has_many :chats

  paginates_per 10

end

