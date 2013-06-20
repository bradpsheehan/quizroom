class StudentsController < ApplicationController

  def new
    @classroom = Classroom.find_by_id(params[:classroom_id])
  end

  def create
    @students = User.find_or_create_students(params[:students])
    classroom = Classroom.find_by_id(params[:classroom_id])
    classroom.add_students(@students)
    UserMailer.invite_students_to_classroom(@students, classroom)
    if classroom.save
      redirect_to classroom_students_path(params[:classroom_id]),
      notice: "Students successfully created."
    else
      redirect_to new_classroom_student_path(params[:classroom_id]),
      notice: "Something went wrong while creating students"
    end
  end

  def index
    @classroom = Classroom.find_by_id(params[:classroom_id])
    @students = @classroom.students #TODO make this only students associated with the classroom
  end
end
