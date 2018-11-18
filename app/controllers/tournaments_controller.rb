class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.order(:inserted_at).page(params[:page])
  end

  def new
    flash[:success] = "new doc"
    @tournament = Tournament.new
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      flash[:success] = "Tournament #{@tournament.name} Created"
      redirect_to tournaments_path
    else
      flash[:error] = "Unable to create Tournament"
      render :new
    end
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update_attributes(tournament_params)
      flash[:success] = "Tournament #{@tournament.name} Updated"
      redirect_to tournaments_path
    else
      flash[:error] = "Unable to update Tournament"
      render :edit
    end
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy
    flash[:success] = "Tournament #{@tournament.name} Destroyed"
    redirect_to tournaments_path
  end

  private

  def tournament_params
    params.require(:tournament).permit(
      :name,
      :description,
      :finished,
      :private,
      :bots,
      :rebuys,
      :start_time,
      :lose_type,
      :tournament_type,
      :starting_chips,
      :max_score,
      :image,
      :inserted_at,
      :updated_at
    )
  end

end
