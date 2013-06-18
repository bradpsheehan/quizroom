class StudentsController < ApplicationController

  def new
    @classroom = Classroom.find(current_user.id, params[:classroom_id])
  end

  def create
    @students = User.find_or_create_students(params[:students])
    Classroom.add_students(params[:classroom_id], @students)
    if @students
      redirect_to classroom_students_path(params[:classroom_id]),
      notice: "Students successfully created."
    else
      redirect_to new_classroom_student_path(params[:classroom_id]),
      notice: "Something went wrong while creating students"
    end
  end

  def index
    @classroom = Classroom.find(current_user.id, params[:classroom_id])
    @students = User.all #TODO make this only students associated with the classroom
  end
end
