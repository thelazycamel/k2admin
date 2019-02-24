class InvitationsController < ApplicationController

  def index
    @tournaments = Tournament.where(private: true, finished: false)
  end

  def for_tournament
    @tournament = Tournament.find(params[:tournament_id])
    @invitations = @tournament.invitations
                     .includes(:user) .order(["invitations.accepted desc","users.username"])
                     .page(params[:page])
  end

  def for_user
    @user = User.find(params[:user_id])
    @invitations = @user.invitations
                      .includes(:tournament)
                      .order(["invitations.accepted desc","tournaments.name"])
                      .page(params[:page])
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params.merge(inserted_at: Time.now, updated_at: Time.now))
    if @invitation.save
      flash[:success] = "Invitation Created"
      redirect_to for_tournament_invitations_path(@invitation.tournament_id)
    else
      flash[:error] = "Unable to create Invitation"
      render :new
    end
  end

  def edit
    @invitation = Invitation.find(params[:id])
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation.updated_at = Time.now
    if @invitation.update_attributes(invitation_params)
      flash[:success] = "Invitation Updated"
      redirect_to for_tournament_invitations_path(@invitation.tournament_id)
    else
      flash[:error] = "Unable to update invitation"
      render :edit
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    flash[:success] = "Invitation Destroyed"
    redirect_to for_tournament_invitations_path(@invitation.tournament_id)
  end

  private

  def invitation_params
    params.require(:invitation).permit(
      :user_id,
      :tournament_id,
      :accepted,
      :inserted_at,
      :updated_at
    )
  end

end

