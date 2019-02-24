class Invitation < ActiveRecord::Base

  belongs_to :tournament
  belongs_to :user

  validates :user_id, uniqueness: {scope: :tournament_id}

  scope :accepted, -> { where(accepted: true) }

  paginates_per 10


end
