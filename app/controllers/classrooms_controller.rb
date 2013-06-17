class ClassroomsController < ApplicationController

  def new
  end

  def show
    @classroom = Classroom.find(current_user.id, params[:id])
  end

  def create
    @classroom = Classroom.create(current_user.id, params[:class_name])
    if @classroom
      redirect_to classroom_path(@classroom.id)
    else
      redirect_to new_classroom_path, notice: "There was a problem creating the clasroom."
    end
  end

end
