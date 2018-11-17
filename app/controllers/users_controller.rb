class UsersController < ApplicationController

  def index
    @users = User.order(:username).page(params[:page])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

end
