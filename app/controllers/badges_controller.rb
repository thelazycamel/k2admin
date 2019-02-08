class BadgesController < ApplicationController

  def index
   @badges = Badge.order(:group, :position).page(params[:page])
  end

  def new
    @badge = Badge.new
  end

  def edit
    @badge = Badge.find(params[:id])
  end

  def create
    @badge = Badge.new(badge_params.merge(inserted_at: Time.now, updated_at: Time.now))
    if @badge.save
      flash[:success] = "Badge #{@badge.name} Created"
      redirect_to badges_path
    else
      flash[:error] = "Unable to create Badge"
      render :new
    end
  end

  def update
    @badge = Badge.find(params[:id])
    if @badge.update_attributes(badge_params)
      flash[:success] = "Badge #{@badge.name} Updated"
      redirect_to badgess_path
    else
      flash[:error] = "Unable to update Badge"
      render :edit
    end
  end

  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy
    flash[:success] = "Badge #{@badge.name} Destroyed"
    redirect_to badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(
      :name,
      :description,
      :image,
      :group,
      :action,
      :position,
      :gold
    )
  end

end
