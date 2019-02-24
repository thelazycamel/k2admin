class TournamentsController < ApplicationController

  def index
    if search = params[:search]
      @tournaments = Tournament.includes(:invitations).where("name ilike ?", "%#{search}%").order(:inserted_at).page(params[:page])
    else
      @tournaments = Tournament.includes(:invitations).order(:inserted_at).page(params[:page])
    end
  end

  def new
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
      :search,
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
      :updated_at,
      :user_id
    )
  end

end
