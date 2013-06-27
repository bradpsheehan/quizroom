class QuestionsController < ApplicationController

  respond_to :json

  def create

    @question = Question.create!(quiz_id: params[:quiz_id], question: params[:question][:question])
    answer = @question.answers.create(question_id: @question.id, answer: params[:answer])
    respond_with @question, location: quiz_question_path(@question.quiz_id, @question)
  end

  def show
    @question = Question.find(params[:id])
    respond_with @question
  end
end
