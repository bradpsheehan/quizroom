class ChatsController < ApplicationController

  def create

    @chat = Chat.create
    redirect_to classroom_chat_path(@chat, params[:classroom_id])

  end

  def update

  end


end
