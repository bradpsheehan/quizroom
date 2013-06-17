class StudentsController < ApplicationController

  def new
    @classroom = Classroom.find(current_user.id, params[:classroom_id])
  end

  def create

  end
end
