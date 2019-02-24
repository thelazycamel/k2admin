class User < ActiveRecord::Base

  has_one :user_stats
  has_many :chats
  has_many :friendships
  has_many :user_tournament_details
  has_many :user_badges
  has_many :badges, through: :user_badges
  has_many :tournaments, through: :user_tournament_details
  has_many :invitations, dependent: :destroy

  scope :uninvited, -> (tournament_id) do
    where("users.id not in (select user_id from invitations WHERE invitations.tournament_id = ?)", tournament_id).order("users.username")
  end

  paginates_per 10

  def chat_disabled?
    self.data["chat_disabled"]
  end

  def admin?
    self.data["admin"]
  end

end
