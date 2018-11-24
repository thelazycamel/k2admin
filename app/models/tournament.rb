class Tournament < ActiveRecord::Base

  has_many :user_tournament_details, dependent: :destroy
  has_many :users, through: :user_tournament_details
  has_many :games, dependent: :destroy
  belongs_to :user
  has_many :chats, dependent: :destroy

  paginates_per 10

end

