class ChatsController < ApplicationController

  respond_to :json, only: :update

  def create

    @chat = Chat.create
    redirect_to classroom_chat_path(@chat, params[:classroom_id])

  end

  def update
    #raise params.inspect
    #@chat = Chat.find_by_id(:id)
    respond_with @chat
  end


end
