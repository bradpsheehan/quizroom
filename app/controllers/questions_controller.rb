class QuestionsController < ApplicationController

  respond_to :json

  def create

    @question = Question.create!(quiz_id: params[:quiz_id], question: params[:question][:question])
    respond_with @question, location: quiz_question_path(@question.quiz_id, @question)
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    respond_with @question, location: quiz_question_path(@question.quiz_id, @question)


  end

end
