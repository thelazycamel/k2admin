class HomeController < ApplicationController

  def index
    @users = User.count
    @tournaments = Tournament.count
    @games = Game.count
    @user_tournament_details = UserTournamentDetail.count
    @anon_users = UserTournamentDetail.where(user_id: nil).count
  end

end
