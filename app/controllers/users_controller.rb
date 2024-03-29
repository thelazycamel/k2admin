class UsersController < ApplicationController

  before_action :coerce_values_to_boolean, only: [:update]

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
  rescue ActiveRecord::RecordNotUnique => e
    if e.message.include?("username_index")
      @user.errors.add(:username, "Already Taken")
    elsif e.message.include?("email_index")
      @user.errors.add(:email, "Already Taken")
    end
    flash.now[:error] = "Unable to update user"
    render :edit
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "#{@user.username} Destroyed"
    redirect_to users_path
  end

  private

  def coerce_values_to_boolean
    params[:user][:data].each do |key, value|
      if ["true","false"].include?(value)
        params[:user][:data][key] = params[:user][:data][key] == "true"
      end
    end
  end

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :blurb,
      :image,
      data: [:chat_disabled, :admin, :mute]
    )
  end

end
