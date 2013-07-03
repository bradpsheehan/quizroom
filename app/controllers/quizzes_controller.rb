class QuizzesController < ApplicationController

  def new
  end

  def show
  end

  def edit
    @quiz = Quiz.find_by_id(params[:id])
    @question = Question.new
  end

  def create
    @quiz = Quiz.create(teacher_id: current_user.id, name: params[:quiz_name])
    redirect_to edit_quiz_path(id: @quiz.id)
  end
end
