module InvitationsHelper

  def users_for_invitations_select(tournament_id)
    if tournament_id
      User.uninvited(tournament_id)
    else
      User.all.order(:username)
    end
  end

end
