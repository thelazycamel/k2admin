class UsersController < ApplicationController

  before_action :coerce_values_to_boolean, only: [:create, :update]

  def index
    if search = params[:search]
      @users = User.where("username ilike ?", "%#{search}%").or(User.where("email ilike ?", "%#{search}%")).order(:username).page(params[:page])
    else
      @users = User.order(:username).page(params[:page])
    end
  end

  def edit
    @user = User.includes(:user_stats).find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "#{@user.username} Updated"
      redirect_to users_path
    else
      flash[:error] = "Unable to update user"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "#{@user.username} Destroyed"
    redirect_to users_path
  end

  private

  def coerce_values_to_boolean
    params[:user][:data][:chat_disabled] = params[:user][:data][:chat_disabled] == "true"
  end

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :blurb,
      :image,
      data: [:chat_disabled]
    )
  end

end
