module TournamentsHelper

  def link_to_tournament_invitations(tournament)
    return "Finished" if tournament.finished
    return "Open to All" unless tournament.private
    return "Duel" if tournament.tournament_type == "duel"
    accepted_invites = tournament.invitations.accepted.count
    text = "#{accepted_invites} of #{tournament.invitations.count} Invites"
    link_to text, for_tournament_invitations_path(tournament.id), class: "btn btn-sm btn-primary"
  end

end
