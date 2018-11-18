class ChatsController < ApplicationController

  def user_chats
    @user= User.find(params[:user_id])
    @chats = Chat.includes(:tournament)
      .order("chats.inserted_at DESC")
      .where(user_id: params[:user_id]).page(params[:page])
  end

  def tournament_chats
    @tournament = Tournament.find(params[:tournament_id])
    @chats = Chat.includes(:user)
      .order("chats.inserted_at DESC")
      .where(tournament_id: params[:tournament_id]).page(params[:page])
  end

end
