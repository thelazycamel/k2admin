class Tournament < ActiveRecord::Base

  has_many :user_tournament_details, dependent: :destroy
  has_many :users, through: :user_tournament_details
  has_many :games, dependent: :destroy
  belongs_to :user
  has_many :chats, dependent: :destroy
  has_many :invitations, dependent: :destroy

  paginates_per 10

  scope :private_open, -> { where(private: true, finished: false, tournament_type: "tournament") }

end

