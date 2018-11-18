class User < ActiveRecord::Base

  has_one :user_stats
  has_many :chats
  has_many :friendships
  has_many :invitations
  has_many :user_tournament_details
  has_many :tournaments, through: :user_tournament_details

  paginates_per 10

end
