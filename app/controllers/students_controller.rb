class StudentsController < ApplicationController
  before_filter :require_login
  before_filter :validate_access_rights
  before_filter :is_teacher, only: [:new, :create]

  def new
    @classroom = Classroom.find_by_id(params[:classroom_id])
  end

  def create
    @students = User.find_or_create_students(params[:students])
    classroom = Classroom.find_by_id(params[:classroom_id])
    classroom.add_students(@students)
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
    @students = @classroom.students
  end

  private

  def is_teacher
    redirect_to root_path unless current_user.teacher?
  end

  def validate_access_rights
    classroom = Classroom.find(params[:classroom_id])
    unless classroom.members.include?(current_user)
      redirect_to root_path,
      notice: "You must be logged in and a member of this Quizroom to view this page!"
    end
  end
end
