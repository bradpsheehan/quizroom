class ChatsController < ApplicationController

  respond_to :json, only: :update

  def show
    @chat = Chat.find_by_id(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
  end

  def create

    @chat = Chat.create(classroom_id: params[:classroom_id])
    redirect_to classroom_chat_path(params[:classroom_id], @chat, quiz_id: params[:quiz_id])

  end

  def update
    #raise params.inspect
    #@chat = Chat.find_by_id(:id)
    respond_with @chat
  end

  def destroy
    chat = Chat.find(params[:id])
    chat.destroy

    @classroom = Classroom.find(params[:classroom_id])
    redirect_to @classroom
  end


end
