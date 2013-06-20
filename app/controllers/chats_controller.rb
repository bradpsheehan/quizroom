class ChatsController < ApplicationController

  respond_to :json, only: :update

  def show
    @chat = Chat.find_by_id(params[:id])
  end

  def create

    @chat = Chat.create
    redirect_to classroom_chat_path(params[:classroom_id], @chat)

  end

  def update
    #raise params.inspect
    #@chat = Chat.find_by_id(:id)
    respond_with @chat
  end


end
