class ClassroomsController < ApplicationController

  def new

  end

  def show
    # @messages = Message.where(classroom_id: params[:id])
    @messages = Message.all
  end

  def create
    # classroom = Classroom.create
    # API.new.create_classroom(params[:classroom])
    redirect_to classroom_path(1)
  end
end
