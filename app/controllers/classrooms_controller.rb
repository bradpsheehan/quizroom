class ClassroomsController < ApplicationController
  respond_to :json, only: :update
  before_filter :require_login
  before_filter :is_teacher, only: [:new, :create]

  def show
    @classroom = Classroom.find_by_id(params[:id])
    if @classroom.in_session?
      redirect_to classroom_chat_path(@classroom, @classroom.chat)
    end
  end

  def create
    @classroom = Classroom.create(teacher_id: current_user.id, name: params[:class_name])
    if @classroom
      redirect_to @classroom
    else
      redirect_to new_classroom_path, notice: "There was a problem creating the clasroom."
    end
  end

  private

  def is_teacher
    redirect_to root_path unless current_user.teacher?
  end

end
