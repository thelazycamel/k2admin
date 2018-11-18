class UsersController < ApplicationController

  def index
    @users = User.order(:username).page(params[:page])
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

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :blurb,
      :image
    )
  end

end
