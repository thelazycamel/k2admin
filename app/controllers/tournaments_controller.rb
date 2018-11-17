class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.order(:inserted_at).page(params[:page])
  end

  def new
    @tournament = Tournament.new
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

end
