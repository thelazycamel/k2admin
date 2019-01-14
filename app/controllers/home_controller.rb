class HomeController < ApplicationController

  def index
    @users = User.count
    @players_online = UserTournamentDetail.where("updated_at > ?", Time.now - 5.minutes).count
    @tournaments = Tournament.count
    @games = Game.count
    @user_tournament_details = UserTournamentDetail.count
    @anon_users = UserTournamentDetail.where(user_id: nil).count
  end

  def run_task
    run_maintenance_task(params[:task])
    flash[:warning] = "Task #{params[:task]} has been run"
    redirect_to action: :index
  end

  private

  def run_maintenance_task(task)
    TaskRunnerCommand.execute("maintenance:#{task}")
  end

end
